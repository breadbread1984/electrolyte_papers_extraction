#!/usr/bin/python3

from oscar import Oscar4

def extract_triplets(tree):
    triplets = list()
    subject = None
    predicate = None
    obj = None
    
    for subtree in tree:
        if type(subtree) is str:
            # skip terminal node
            continue
        # find object, predicate, subject in this subtree
        if subtree.label() == 'NounPhrase' and not subject:
            # generate object from noun phrase
            subject = ' '.join(subtree.leaves())
        elif subtree.label() == 'VerbPhrase':
            # generate predicate and subject from verb phrase
            for vp_subtree in subtree:
                if type(vp_subtree) is str: continue
                if vp_subtree.label().startswith('V'):
                    predicate = ' '.join(vp_subtree.leaves())
                elif vp_subtree.label() in ['NounPhrase', 'PrepPhrase']:
                    # both noun phrase and preposition phrase can be subject
                    obj = ' '.join(vp_subtree.leaves())
        # if this is a non-terminal node, recursively generate triplets among its children
        if len(subtree) > 0:
            triplets.extend(extract_triplets(subtree))
    if subject and predicate and obj:
        triplets.append((subject, predicate, obj))
    
    return triplets

if __name__ == "__main__":
  oscar = Oscar4()
  tree = oscar.parse("A solution of 124C (7.0 g, 32.4 mmol) in concentrate H2SO4 " +
                "(9.5 mL) was added to a solution of concentrate H2SO4 (9.5 mL) " +
                "and fuming HNO3 (13 mL) and the mixture was heated at 60°C for " +
                "30 min. After cooling to room temperature, the reaction mixture " +
                "was added to iced 6M solution of NaOH (150 mL) and neutralized " +
                "to pH 6 with 1N NaOH solution. The reaction mixture was extracted " +
                "with dichloromethane (4x100 mL). The combined organic phases were " +
                "dried over Na2SO4, filtered and concentrated to give 124D as a solid.")
  print(extract_triplets(tree))
