import pickle
import numpy as np
import networkx as nx
import pandas as pd
from pyvis.network import Network
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt

with open('author_weights.pkl', 'rb') as f:
    data = pickle.load(f)

with open('authors.pkl', 'rb') as f:
    element_id_to_author = pickle.load(f)

G = nx.Graph()
scaler = MinMaxScaler()

weights = np.array([data[id_][0] for id_ in data.keys()]).reshape(-1, 1)
scaled_weights = scaler.fit_transform(weights).flatten()
min_node_size = 5

for id_, scaled_weight in zip(data.keys(), scaled_weights):
    node_size = max(scaled_weight * 500, min_node_size)
    G.add_node(id_, value=node_size)

total_citation = pd.read_pickle('total_citation.npz', compression = 'gzip')

for row in total_citation.index:
    for col in total_citation.columns:
        if total_citation.at[row, col] > 0:
            G.add_edge(row, col, weight=total_citation.at[row, col])

net = Network(height="1200px", width="100%", notebook=True)

net.from_nx(G)

connected_components = list(nx.connected_components(G))
num_components = len(connected_components)

colors = [plt.cm.Pastel1(i / num_components) for i in range(num_components)]
colors = ['#%02x%02x%02x' % (int(r*255), int(g*255), int(b*255)) for r, g, b, _ in colors]

component_color_map = {}
for i, component in enumerate(connected_components):
    color = colors[i]
    for node in component:
        component_color_map[node] = color

for node in net.nodes:
    node_id = node['id']
    node['size'] = G.nodes[node_id]['value']  
    node['label'] = element_id_to_author.get(node_id, str(node_id)) 
    node['color'] = component_color_map[node_id] 

uniform_width = 2
for edge in net.edges:
    edge['width'] = uniform_width

net.set_options("""
var options = {
  "physics": {
    "barnesHut": {
      "gravitationalConstant": -20,
      "centralGravity": 0.3,
      "springLength": 95,
      "springConstant": 0.04,
      "damping": 0.09,
      "avoidOverlap": 0.5
    }
  }
}
""")

net.show('author_weights_network.html')
