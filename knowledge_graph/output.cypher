:begin
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:859, properties:{id:"orcid.org/0000-0002-9214-0347"}}, {_id:864, properties:{id:"orcid.org/0000-0001-9503-5561"}}, {_id:875, properties:{id:"orcid.org/0000-0001-8445-8032"}}, {_id:882, properties:{id:"orcid.org/"}}, {_id:898, properties:{id:"orcid.org/0000-0003-3085-662X"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Identifier;
UNWIND [{_id:708, properties:{id:"Division of Materials Science & Engineering"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Department;
UNWIND [{_id:309, properties:{id:"The Chemistry of Imperfect Crystals"}}, {_id:310, properties:{id:"The Chemical Diffusion in Solids"}}, {_id:326, properties:{id:"Physical Chemistry of Solids"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Book;
UNWIND [{_id:662, properties:{id:"all-solid-state batteries"}}, {_id:710, properties:{id:"Lithium ion batteries"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Technology;
UNWIND [{_id:244, properties:{id:"10.1002/celc.202101479"}}, {_id:250, properties:{id:"e202101479"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:DOI;
UNWIND [{_id:840, properties:{id:"1. 原子分子簇科学教育部重点实验室, 光电转换材料北京市重点实验室, 北京理工大学化学与化工学院, 北京 100190"}}, {_id:841, properties:{id:"1. Key Laboratory of Cluster Science of Ministry of Education, Beijing Key Laboratory of Photoelectronic/Electrophotonic Conversion Materials, School of Chemistry and Chemical Engineering, Beijing Institute of Technology, Beijing 100190, China"}}, {_id:844, properties:{id:"2. School of Materials Science & Engineering, Beijing Institute of Technology, Beijing 100190, China"}}, {_id:846, properties:{id:"2. 北京理工大学材料科学与工程学院, 北京 100190"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Affiliation;
UNWIND [{_id:936, properties:{id:"anhydrous diethyl carbonate (DEC)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Solvent;
UNWIND [{_id:955, properties:{id:"The cell"}}, {_id:957, properties:{id:"All of the cells"}}, {_id:991, properties:{id:"Li-In/PPC-ICP + - LPSCl/Li-In"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Cell;
UNWIND [{_id:31, properties:{id:"X.Y."}}, {_id:73, properties:{id:"E-mail: shims@che.kyutech.ac.jp"}}, {_id:327, properties:{id:"juliaushakova@rambler.ru"}}, {_id:429, properties:{id:"max.weeber@ipa.fraunhofer.de"}}, {_id:470, properties:{id:"peter.birke@ipv.uni-stuttgart.de"}}, {_id:671, properties:{id:"dwshin@hanyang.ac.kr"}}, {_id:782, properties:{id:"wsu@mail.ntust.edu.tw"}}, {_id:798, properties:{id:"wush@mail.ntust.edu.tw"}}, {_id:807, properties:{id:"bjh@mail.ntust.edu.tw"}}, {_id:819, properties:{id:"artur.tron@ait.ac.at"}}, {_id:824, properties:{id:"alexander.beutl@ait.ac.at"}}, {_id:881, properties:{id:"kitaura-22@aist.go.jp"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Email;
UNWIND [{_id:541, properties:{id:"Timcal Co. Ltd"}}, {_id:544, properties:{id:"Hitachi Chemical"}}, {_id:549, properties:{id:"Jacomex"}}, {_id:555, properties:{id:"Solvionic"}}, {_id:588, properties:{id:"Samsung Electronics Co. Ltd"}}, {_id:597, properties:{id:"Specac"}}, {_id:602, properties:{id:"TEC ONE Co. Ltd."}}, {_id:930, properties:{id:"Sigma-Aldrich"}}, {_id:941, properties:{id:"Shin Hyung E&T Corp."}}, {_id:944, properties:{id:"EcoPro BM Co. (Korea)"}}, {_id:954, properties:{id:"POSCO JK Solid Solution Co. (Korea)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Company;
UNWIND [{_id:303, properties:{id:"Medvedeva, O.V., Kalinina, L.A., Metlin, Yu.G., and Ushakova, Yu.N."}}, {_id:307, properties:{id:"Kalinina, L.A., Shirokova, G.I., Lyalina, M.Yu., and Murin, I.V."}}, {_id:315, properties:{id:"Ushakova, Yu.N., Kalinina, L.A., Fominykh, E.G., Yurlov, I.S., and Murin, I.V."}}, {_id:323, properties:{id:"Ushakova, Yu.N., Kalinina, L.A., Murin, I.V., and Shirokova, G.I."}}, {_id:325, properties:{id:"Kalinina, L.A., Shirokova, G.I., Murin, I.V., Ushakova, Yu.N., Fominykh, E.G., and Lyalina, M.Yu."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Authors;
UNWIND [{_id:35, properties:{id:"ScienceDirect"}}, {_id:37, properties:{id:"SciVerse"}}, {_id:38, properties:{id:"SciVerse ScienceDirect"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Platform;
UNWIND [{_id:58, properties:{id:"1-1 Sensui-cho, Tobata, Kitakyushu 804-8550, Japan"}}, {_id:638, properties:{id:"Upton, NY 11973, USA"}}, {_id:639, properties:{id:"Seoul 03722, Republic of Korea"}}, {_id:640, properties:{id:"Gaithersburg, MD 20899, USA"}}, {_id:644, properties:{id:"New York, NY 10027, USA"}}, {_id:718, properties:{id:"222 Wangsimni-ro, Seongdong-gu, Seoul 133-791, South Korea"}}, {_id:833, properties:{id:"Giefinggasse 2, 1210 Vienna, Austria"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Address;
UNWIND [{_id:486, properties:{id:"University of Rochester"}}, {_id:993, properties:{id:"Georgia Institute of Technology"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Institution;
UNWIND [{_id:629, properties:{id:"Brookhaven National Laboratory"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Laboratory;
UNWIND [{_id:39, properties:{id:"Journal of Power Sources"}}, {_id:42, properties:{id:"ACS Sustainable Chem. Eng."}}, {_id:48, properties:{id:"ACS Sustainable Chemistry & Engineering"}}, {_id:51, properties:{id:"CHEMICAL SENSORS"}}, {_id:57, properties:{id:"J O U R N A L O F M A T E R I A L S S C I E N C E"}}, {_id:68, properties:{id:"Journal of Materials Science"}}, {_id:86, properties:{id:"Journal of Alloys and Compounds"}}, {_id:100, properties:{id:"ACS Nano"}}, {_id:143, properties:{id:"Mater. Res. Bull."}}, {_id:148, properties:{id:"Nat. Mater."}}, {_id:149, properties:{id:"J. Phys. Chem. C"}}, {_id:152, properties:{id:"Sci. Rep."}}, {_id:156, properties:{id:"Israel J. Chem."}}, {_id:164, properties:{id:"Chem. Mater."}}, {_id:171, properties:{id:"J. Electrochem. Soc."}}, {_id:174, properties:{id:"Energy Technol."}}, {_id:176, properties:{id:"Angew. Chem., Int. Ed."}}, {_id:184, properties:{id:"Nano Lett."}}, {_id:190, properties:{id:"Adv. Mater."}}, {_id:193, properties:{id:"Energy Environ. Sci."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Journal;
UNWIND [{_id:207, properties:{id:"J. Mater. Chem."}}, {_id:211, properties:{id:"Adv. Funct. Mater."}}, {_id:215, properties:{id:"J. Power Sources"}}, {_id:229, properties:{id:"J. Am. Chem. Soc."}}, {_id:258, properties:{id:"ChemElectroChem"}}, {_id:265, properties:{id:"ACS Appl. Mater. Interfaces"}}, {_id:279, properties:{id:"Solid State Ionics"}}, {_id:321, properties:{id:"Russian Journal of Electrochemistry"}}, {_id:528, properties:{id:"Journal of Electrochemistry"}}, {_id:546, properties:{id:"Carbon"}}, {_id:562, properties:{id:"Adv. Energy Mater."}}, {_id:585, properties:{id:"J. Solid State Electrochem."}}, {_id:600, properties:{id:"J. Mater. Chem. A"}}, {_id:612, properties:{id:"Materials Chemistry Frontiers"}}, {_id:642, properties:{id:"Cell Reports Physical Science"}}, {_id:655, properties:{id:"Angewandte Chemie International Edition"}}, {_id:656, properties:{id:"Energy Storage Materials"}}, {_id:658, properties:{id:"Angewandte Chemie"}}, {_id:686, properties:{id:"Journal of Electroceramics"}}, {_id:732, properties:{id:"Chemical Engineering Journal"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Journal;
UNWIND [{_id:820, properties:{id:"Electrochem. Sci. Adv."}}, {_id:1005, properties:{id:"Catal. Lett."}}, {_id:1025, properties:{id:"This Journal"}}, {_id:1097, properties:{id:"Nat. Energy"}}, {_id:1141, properties:{id:"ACS Energy Lett."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Journal;
UNWIND [{_id:932, properties:{id:"X-ray photoelectron spectroscopy (XPS) analysis"}}, {_id:940, properties:{id:"EIS analysis"}}, {_id:945, properties:{id:"preparation of the composite cathode"}}, {_id:953, properties:{id:"sulﬁde-based ISEs and the oxidation of the passivation layer on the active material surface"}}, {_id:962, properties:{id:"Li plating and stripping cycling at different current densities for 250 h"}}, {_id:963, properties:{id:"ion milling using an Ar-ion source"}}, {_id:965, properties:{id:"form a solid electrolyte layer"}}, {_id:967, properties:{id:"poly(ethylene oxide) (PEO, Mw = 100 000; Sigma-Aldrich) and LiTFSI were dissolved in anisole (purity 99.7%, to form a solution ([EO]:[Li] = 10:1)"}}, {_id:976, properties:{id:"preparation of the electrolyte layer"}}, {_id:985, properties:{id:"disassembling it inside the glove box and sampling it into a dedicated holder"}}, {_id:986, properties:{id:"an Ar-ion source in the range of 4–6 kV in an inert environment"}}, {_id:989, properties:{id:"ﬁlls the gaps between solid interfaces, establishes ion transport pathways, and can accommodate volume changes in the cathode material during charge and discharge processes"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Process;
UNWIND [{_id:281, properties:{id:"PDF analysis and structure simulation"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Activity;
UNWIND [{_id:278, properties:{id:"Original Draft"}}, {_id:300, properties:{id:"Review & Editing"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Document;
UNWIND [{_id:28, properties:{id:"solvents"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chemical;
UNWIND [{_id:32, properties:{id:"project"}}, {_id:312, properties:{id:"Determination of Diffusion Coefficients for Sulfide Ions in Solid"}}, {_id:575, properties:{id:"research"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Project;
UNWIND [{_id:789, properties:{id:"research objective"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:781, properties:{id:"schemes"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Schemes;
UNWIND [{_id:687, properties:{id:"Pelletized"}}, {_id:722, properties:{id:"pelletized"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:State;
UNWIND [{_id:787, properties:{id:"DFT calculation and analysis"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Analysis;
UNWIND [{_id:34, properties:{id:"240 (2013) 510e514"}}, {_id:256, properties:{id:"9"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Volume;
UNWIND [{_id:43, properties:{id:"Yonsei University"}}, {_id:506, properties:{id:"Ulsan National Institute of Science and Technology (UNIST)"}}, {_id:617, properties:{id:"University of California, Berkeley"}}, {_id:621, properties:{id:"Columbia University"}}, {_id:905, properties:{id:"University of Maryland College Park"}}, {_id:907, properties:{id:"University of Maryland-College Park"}}, {_id:910, properties:{id:"University of Maryland"}}, {_id:911, properties:{id:"Hiroshima University"}}, {_id:912, properties:{id:"Zhejiang University"}}, {_id:914, properties:{id:"Huazhong University of Science and Technology"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:University;
UNWIND [{_id:484, properties:{id:"River Campus & Miner Libraries"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Library;
UNWIND [{_id:769, properties:{id:"Vienna ab-initio simulation package"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Software;
UNWIND [{_id:75, properties:{id:"N. SOUDA, Y. SHIMIZU"}}, {_id:314, properties:{id:"Kroeger, F.A."}}, {_id:324, properties:{id:"Chebotin, V.N."}}, {_id:518, properties:{id:"Na-chuan YANG"}}, {_id:519, properties:{id:"Shuai Yi"}}, {_id:520, properties:{id:"Kang-hua CHEN"}}, {_id:521, properties:{id:"Na-chuan YANG, Yu WANG, Yi SHUAI, Kang-huan CHEN"}}, {_id:522, properties:{id:"Na-chuan YANG, Yu WANG, Yi SHUAI, Kang-hua CHEN"}}, {_id:523, properties:{id:"Wang Yu"}}, {_id:524, properties:{id:"Yu WANG"}}, {_id:525, properties:{id:"Kang-hua Chen"}}, {_id:526, properties:{id:"Yi SHUAI"}}, {_id:527, properties:{id:"Yang Na-chuan"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Author;
UNWIND [{_id:699, properties:{id:"South Korea"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Country;
UNWIND [{_id:745, properties:{id:"argon atmosphere"}}, {_id:772, properties:{id:"room temperature"}}, {_id:952, properties:{id:"an Ar-ﬁlled glove box (H2O < 1 ppm, O2 < 1 ppm)"}}, {_id:990, properties:{id:"an insulating mold with a diameter of 13 mm within an argon-ﬁlled glove box, maintaining an inert atmosphere"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Environment;
UNWIND [{_id:842, properties:{id:"Lu Lv1, Lei Zhou1, Muhammad Khurram Tufail1, Le Yang1, Renjie Chen2*, Wen Yang1*"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:AuthorList;
UNWIND [{_id:53, properties:{id:"sulfur gas sensors"}}, {_id:56, properties:{id:"solid electrolyte or auxiliary phase"}}, {_id:74, properties:{id:"SO2 detection"}}, {_id:740, properties:{id:"all-solid-state lithium batteries"}}, {_id:750, properties:{id:"sulfide electrolyte-based ASSLBs"}}, {_id:761, properties:{id:"conductive additive-free ASSLBs"}}, {_id:982, properties:{id:"all-solid-state batteries"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Application;
UNWIND [{_id:0, properties:{id:"C. S. Choi"}}, {_id:1, properties:{id:"Duygu Karabelli"}}, {_id:2, properties:{id:"Zhao"}}, {_id:3, properties:{id:"H. Iba"}}, {_id:33, properties:{id:"Xiaolei Zhao"}}, {_id:44, properties:{id:"Byungchan Han"}}, {_id:45, properties:{id:"Hoje Chun"}}, {_id:46, properties:{id:"Kyungju Nam"}}, {_id:49, properties:{id:"Jeemin Hwang"}}, {_id:78, properties:{id:"Gahyun Kim"}}, {_id:79, properties:{id:"Soojin Park"}}, {_id:80, properties:{id:"Sungjin Cho"}}, {_id:81, properties:{id:"Youngjin Song"}}, {_id:82, properties:{id:"Hyeongseok Lee"}}, {_id:84, properties:{id:"Jae-Hun Kim"}}, {_id:85, properties:{id:"Young Whan Cho"}}, {_id:88, properties:{id:"Yong-Jin Jang"}}, {_id:92, properties:{id:"Woosuk Cho"}}, {_id:97, properties:{id:"Hyungeun Seo"}}, {_id:98, properties:{id:"Young-Su Lee"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:101, properties:{id:"Nazar, L. F."}}, {_id:102, properties:{id:"Tarascon, J.-M."}}, {_id:103, properties:{id:"Ji, X. L."}}, {_id:104, properties:{id:"Osada, M."}}, {_id:105, properties:{id:"Ohta, N."}}, {_id:106, properties:{id:"Teragawa, S."}}, {_id:107, properties:{id:"Trevey, J. E."}}, {_id:108, properties:{id:"Kamiyama, T."}}, {_id:109, properties:{id:"Asoka, T."}}, {_id:110, properties:{id:"Nagata, H."}}, {_id:111, properties:{id:"Rhyner, U."}}, {_id:112, properties:{id:"Liang, C."}}, {_id:113, properties:{id:"Kim, S. C."}}, {_id:114, properties:{id:"Bates, J. B."}}, {_id:115, properties:{id:"Tanabe, K."}}, {_id:116, properties:{id:"Kumazaki, S."}}, {_id:117, properties:{id:"Sung Youb Kim"}}, {_id:118, properties:{id:"Bron, P."}}, {_id:119, properties:{id:"Dehnen, S."}}, {_id:120, properties:{id:"Hama, S."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:121, properties:{id:"Chin, T. E."}}, {_id:122, properties:{id:"Murugan, R."}}, {_id:123, properties:{id:"Shin, D. W."}}, {_id:124, properties:{id:"Kato, Y."}}, {_id:125, properties:{id:"Liu, Z."}}, {_id:126, properties:{id:"Shin, B. R."}}, {_id:127, properties:{id:"Koyama, Y."}}, {_id:128, properties:{id:"Sakuda, A."}}, {_id:129, properties:{id:"Hirayama, T."}}, {_id:130, properties:{id:"Mitsui, A."}}, {_id:131, properties:{id:"Murayama, M."}}, {_id:132, properties:{id:"Tatsumisago, M."}}, {_id:133, properties:{id:"Kanamura, K."}}, {_id:134, properties:{id:"Yamamoto, K."}}, {_id:135, properties:{id:"Yoon Seok Jung"}}, {_id:136, properties:{id:"Nam, Y. J."}}, {_id:137, properties:{id:"Tadanaga, K."}}, {_id:138, properties:{id:"Yoshida, T."}}, {_id:139, properties:{id:"Jung, Y. S."}}, {_id:140, properties:{id:"Sung-Ju Cho"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:141, properties:{id:"George, S. M."}}, {_id:142, properties:{id:"Patil, V."}}, {_id:144, properties:{id:"Cavanagh, A. S."}}, {_id:145, properties:{id:"Aso, K."}}, {_id:146, properties:{id:"Sauvage, F."}}, {_id:147, properties:{id:"Zick, K."}}, {_id:150, properties:{id:"Kihira, Y."}}, {_id:151, properties:{id:"Yersak, T. A."}}, {_id:153, properties:{id:"Stramare, S."}}, {_id:154, properties:{id:"Kim, K. H."}}, {_id:155, properties:{id:"Kim, J. W."}}, {_id:157, properties:{id:"Hayashi, A."}}, {_id:158, properties:{id:"Yamada, A."}}, {_id:160, properties:{id:"Sonoyama, N."}}, {_id:161, properties:{id:"Patil, A."}}, {_id:162, properties:{id:"auf der Guenne, J. S."}}, {_id:165, properties:{id:"Ota, T."}}, {_id:166, properties:{id:"Roling, B."}}, {_id:167, properties:{id:"Hart, F. X."}}, {_id:168, properties:{id:"Holman, R. K."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:169, properties:{id:"Oh, D. Y."}}, {_id:170, properties:{id:"Mizuno, F."}}, {_id:172, properties:{id:"Hall, S. R."}}, {_id:173, properties:{id:"Chikusa, Y."}}, {_id:175, properties:{id:"Hirayama, M."}}, {_id:177, properties:{id:"Robertson, J. D."}}, {_id:178, properties:{id:"Tani, T."}}, {_id:179, properties:{id:"Choi, J.-W."}}, {_id:180, properties:{id:"Ma, R."}}, {_id:181, properties:{id:"Choi, Y. S."}}, {_id:182, properties:{id:"Kawamoto, K."}}, {_id:183, properties:{id:"Johansson, S."}}, {_id:185, properties:{id:"Fu, W."}}, {_id:186, properties:{id:"Sato, Y."}}, {_id:187, properties:{id:"Fisher, C. A."}}, {_id:188, properties:{id:"Kobayashi, T."}}, {_id:189, properties:{id:"Kim, D. H."}}, {_id:191, properties:{id:"Homma, K."}}, {_id:192, properties:{id:"Lee, K. T."}}, {_id:194, properties:{id:"Wang, B."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:195, properties:{id:"Young Jin Nam"}}, {_id:196, properties:{id:"Jun-Muk Lim"}}, {_id:197, properties:{id:"Oh, K. H."}}, {_id:198, properties:{id:"Munakata, H."}}, {_id:199, properties:{id:"Jun Ho Song"}}, {_id:200, properties:{id:"Paik, D.-S."}}, {_id:201, properties:{id:"Seino, Y."}}, {_id:202, properties:{id:"Seki, J."}}, {_id:203, properties:{id:"Yonemura, M."}}, {_id:204, properties:{id:"Nagao, M."}}, {_id:205, properties:{id:"Sales, B. C."}}, {_id:206, properties:{id:"Yoon, S.-J."}}, {_id:208, properties:{id:"Kondo, S."}}, {_id:209, properties:{id:"Park, K. H."}}, {_id:210, properties:{id:"Kotobuki, M."}}, {_id:212, properties:{id:"Asaka, T."}}, {_id:213, properties:{id:"Sang-Young Lee"}}, {_id:214, properties:{id:"Inada, T."}}, {_id:216, properties:{id:"Yamakawa, Y."}}, {_id:217, properties:{id:"Yagi, Y."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:218, properties:{id:"Lee, Y.-G."}}, {_id:220, properties:{id:"Ogumi, Z."}}, {_id:221, properties:{id:"Takada, K."}}, {_id:222, properties:{id:"Dudney, N. J."}}, {_id:223, properties:{id:"Weppner, W."}}, {_id:224, properties:{id:"Baudrin, E."}}, {_id:225, properties:{id:"Thangadurai, V."}}, {_id:226, properties:{id:"Lee, S.-H."}}, {_id:227, properties:{id:"Zhang, L."}}, {_id:228, properties:{id:"Lee, S. H."}}, {_id:230, properties:{id:"Chiang, Y. M."}}, {_id:231, properties:{id:"Lin, Z."}}, {_id:233, properties:{id:"Sasaki, T."}}, {_id:234, properties:{id:"Young-Gi Lee"}}, {_id:235, properties:{id:"Kamaya, N."}}, {_id:236, properties:{id:"Zuhr, R. A."}}, {_id:237, properties:{id:"Iriyama, Y."}}, {_id:238, properties:{id:"Ohta, S."}}, {_id:239, properties:{id:"Dae Yang Oh"}}, {_id:240, properties:{id:"Kanno, R."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:241, properties:{id:"Woo, J. H."}}, {_id:242, properties:{id:"Borong Wu"}}, {_id:246, properties:{id:"Yinghui Cai"}}, {_id:251, properties:{id:"Zhikun Zhao"}}, {_id:253, properties:{id:"Daobin Mu"}}, {_id:254, properties:{id:"Chunli Li"}}, {_id:262, properties:{id:"Zhaoxin Yu"}}, {_id:263, properties:{id:"Ruozhu Feng"}}, {_id:266, properties:{id:"Kiseuk Ahn"}}, {_id:267, properties:{id:"Daniel T. Marty"}}, {_id:270, properties:{id:"Shun-Li Shang"}}, {_id:271, properties:{id:"Mark H. Engelhard"}}, {_id:273, properties:{id:"Zi-Kui Liu"}}, {_id:274, properties:{id:"Dongping Lu"}}, {_id:280, properties:{id:"Masahiro Tatsumisago"}}, {_id:282, properties:{id:"Tomoki Uchiyama"}}, {_id:285, properties:{id:"Koji Ohara"}}, {_id:286, properties:{id:"Tsuyoshi Takami"}}, {_id:288, properties:{id:"Toshiki Watanabe"}}, {_id:292, properties:{id:"Atsushi Sakuda"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:294, properties:{id:"Yoshiharu Uchimoto"}}, {_id:295, properties:{id:"Masakuni Takahashi"}}, {_id:297, properties:{id:"Seunghoon Yang"}}, {_id:298, properties:{id:"Akitoshi Hayashi"}}, {_id:302, properties:{id:"Kentaro Yamamoto"}}, {_id:304, properties:{id:"I.S. Yurlov"}}, {_id:308, properties:{id:"G.I. Shirokova"}}, {_id:313, properties:{id:"B.A. Ananchenko"}}, {_id:322, properties:{id:"Yu.N. Ushakova"}}, {_id:328, properties:{id:"O.V. Medvedeva"}}, {_id:329, properties:{id:"L.A. Kalinina"}}, {_id:330, properties:{id:"Y. Nishi"}}, {_id:331, properties:{id:"R. Kanno"}}, {_id:332, properties:{id:"S. P. Culver"}}, {_id:333, properties:{id:"Y. Guo"}}, {_id:334, properties:{id:"S. Xia"}}, {_id:336, properties:{id:"Hayashi"}}, {_id:337, properties:{id:"J. Y. Lee"}}, {_id:338, properties:{id:"A. Mitsui"}}, {_id:339, properties:{id:"Dou"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:340, properties:{id:"Senyshyn"}}, {_id:341, properties:{id:"P. Barai"}}, {_id:342, properties:{id:"T. Kato"}}, {_id:343, properties:{id:"W. Luo"}}, {_id:344, properties:{id:"Fergus"}}, {_id:345, properties:{id:"V. Wood"}}, {_id:346, properties:{id:"Y. Sadaoka"}}, {_id:347, properties:{id:"Y. Yamakawa"}}, {_id:348, properties:{id:"Guo"}}, {_id:349, properties:{id:"Karabelli"}}, {_id:350, properties:{id:"Xia"}}, {_id:351, properties:{id:"S. X. Dou"}}, {_id:352, properties:{id:"N. Kamaya"}}, {_id:355, properties:{id:"Weeber"}}, {_id:356, properties:{id:"Barai"}}, {_id:357, properties:{id:"Imanaka"}}, {_id:358, properties:{id:"Minafra"}}, {_id:359, properties:{id:"S. Hori"}}, {_id:360, properties:{id:"Ji"}}, {_id:361, properties:{id:"Wu"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:362, properties:{id:"Dunn"}}, {_id:363, properties:{id:"Wen"}}, {_id:364, properties:{id:"Yonemura"}}, {_id:365, properties:{id:"R. P. Rao"}}, {_id:366, properties:{id:"R. H. DeBlock"}}, {_id:367, properties:{id:"Chen"}}, {_id:368, properties:{id:"Stalin"}}, {_id:369, properties:{id:"Culver"}}, {_id:370, properties:{id:"Yan"}}, {_id:371, properties:{id:"R. Zahn"}}, {_id:372, properties:{id:"Nishi"}}, {_id:373, properties:{id:"J. W. Fergus"}}, {_id:374, properties:{id:"Tatsumisago"}}, {_id:375, properties:{id:"J. Wu"}}, {_id:376, properties:{id:"Lau"}}, {_id:377, properties:{id:"F. Hou"}}, {_id:378, properties:{id:"Zhoua"}}, {_id:379, properties:{id:"Whittingham"}}, {_id:380, properties:{id:"H. Duan"}}, {_id:381, properties:{id:"S. Stalin"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:382, properties:{id:"K. Zhang"}}, {_id:383, properties:{id:"Duan"}}, {_id:384, properties:{id:"A. Hayashi"}}, {_id:385, properties:{id:"Luo"}}, {_id:386, properties:{id:"Q. Zhao"}}, {_id:387, properties:{id:"Choi"}}, {_id:388, properties:{id:"Kamaya"}}, {_id:389, properties:{id:"Wood"}}, {_id:390, properties:{id:"Xiang"}}, {_id:391, properties:{id:"Kanno"}}, {_id:392, properties:{id:"M. Tatsumisago"}}, {_id:393, properties:{id:"Max Weeber"}}, {_id:394, properties:{id:"A. Sakuda"}}, {_id:395, properties:{id:"Iba"}}, {_id:396, properties:{id:"C. Li"}}, {_id:397, properties:{id:"Y. Kamaya"}}, {_id:398, properties:{id:"Kang"}}, {_id:399, properties:{id:"H. Li"}}, {_id:400, properties:{id:"H. Aono"}}, {_id:401, properties:{id:"B. S. Dunn"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:403, properties:{id:"X. Yan"}}, {_id:404, properties:{id:"Hirayama"}}, {_id:405, properties:{id:"Sadaoka"}}, {_id:406, properties:{id:"W. Xia"}}, {_id:407, properties:{id:"Nagao"}}, {_id:408, properties:{id:"Birke"}}, {_id:409, properties:{id:"M. Murayama"}}, {_id:410, properties:{id:"S. Adams"}}, {_id:411, properties:{id:"G. Adachi"}}, {_id:412, properties:{id:"L. Wanga"}}, {_id:413, properties:{id:"Y. Cui"}}, {_id:414, properties:{id:"N. Minafra"}}, {_id:415, properties:{id:"Murayama"}}, {_id:416, properties:{id:"Hori"}}, {_id:417, properties:{id:"Zhang"}}, {_id:418, properties:{id:"Aono"}}, {_id:419, properties:{id:"Lee"}}, {_id:420, properties:{id:"Adams"}}, {_id:421, properties:{id:"Liang"}}, {_id:422, properties:{id:"B. Xu"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:423, properties:{id:"N. Imanaka"}}, {_id:424, properties:{id:"H. Xiang"}}, {_id:425, properties:{id:"Kato"}}, {_id:426, properties:{id:"X. Chen"}}, {_id:427, properties:{id:"C. Z. Zhao"}}, {_id:428, properties:{id:"Kai Peter Birke"}}, {_id:430, properties:{id:"Zou"}}, {_id:431, properties:{id:"Rosero-Navarro"}}, {_id:432, properties:{id:"L. Wen"}}, {_id:433, properties:{id:"G. Ji"}}, {_id:434, properties:{id:"W. Liu"}}, {_id:435, properties:{id:"C. Zou"}}, {_id:436, properties:{id:"D. M. Butts"}}, {_id:437, properties:{id:"Carolina Rosero-Navarro"}}, {_id:439, properties:{id:"Xu"}}, {_id:440, properties:{id:"L. A. Archer"}}, {_id:441, properties:{id:"M. Nagao"}}, {_id:442, properties:{id:"Homma"}}, {_id:443, properties:{id:"D. S. Ashby"}}, {_id:444, properties:{id:"W. G. Zeier"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:445, properties:{id:"DeBlock"}}, {_id:446, properties:{id:"Zeier"}}, {_id:447, properties:{id:"R. Lagadec"}}, {_id:448, properties:{id:"K. Homma"}}, {_id:450, properties:{id:"Adachi"}}, {_id:451, properties:{id:"Lagadec"}}, {_id:452, properties:{id:"Yamakawa"}}, {_id:453, properties:{id:"M. Yonemura"}}, {_id:454, properties:{id:"M. Hirayama"}}, {_id:455, properties:{id:"Higa"}}, {_id:456, properties:{id:"Cui"}}, {_id:457, properties:{id:"Z. Zhoua"}}, {_id:458, properties:{id:"A. Senyshyn"}}, {_id:459, properties:{id:"K. Higa"}}, {_id:460, properties:{id:"X. Wu"}}, {_id:461, properties:{id:"Li"}}, {_id:462, properties:{id:"Srinivasan"}}, {_id:463, properties:{id:"Archer"}}, {_id:464, properties:{id:"J. Liang"}}, {_id:465, properties:{id:"J. Lau"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:466, properties:{id:"Rao"}}, {_id:467, properties:{id:"M. S. Whittingham"}}, {_id:468, properties:{id:"E. Sugimoto"}}, {_id:469, properties:{id:"Mitsui"}}, {_id:471, properties:{id:"Butts"}}, {_id:472, properties:{id:"Sakuda"}}, {_id:474, properties:{id:"Liu"}}, {_id:475, properties:{id:"V. Srinivasan"}}, {_id:476, properties:{id:"H. Liu"}}, {_id:477, properties:{id:"Z. Zhang"}}, {_id:478, properties:{id:"Ashby"}}, {_id:479, properties:{id:"Zahn"}}, {_id:480, properties:{id:"Wanga"}}, {_id:481, properties:{id:"Sugimoto"}}, {_id:482, properties:{id:"H. Kang"}}, {_id:483, properties:{id:"Hou"}}, {_id:489, properties:{id:"T.-U. Wi"}}, {_id:490, properties:{id:"Seong Hyeon Kweon"}}, {_id:492, properties:{id:"Y. B. Song"}}, {_id:493, properties:{id:"D. Y. Oh"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:494, properties:{id:"Y. S. Jung"}}, {_id:495, properties:{id:"Su Jeong Yeom"}}, {_id:496, properties:{id:"S. K. Kwak"}}, {_id:497, properties:{id:"J. Woo"}}, {_id:498, properties:{id:"S. H. Kweon"}}, {_id:499, properties:{id:"J. C. Kim"}}, {_id:500, properties:{id:"S. J. Yeom"}}, {_id:501, properties:{id:"A. R. Ha"}}, {_id:502, properties:{id:"Ji Eun Lee"}}, {_id:503, properties:{id:"Tae-Ung Wi"}}, {_id:504, properties:{id:"Jehoon Woo"}}, {_id:505, properties:{id:"KyungSu Kim"}}, {_id:507, properties:{id:"Jin Chul Kim"}}, {_id:508, properties:{id:"Yong Bae Song"}}, {_id:509, properties:{id:"W. Cho"}}, {_id:510, properties:{id:"H.-W. Lee"}}, {_id:511, properties:{id:"K.-H. Park"}}, {_id:512, properties:{id:"K. Kim"}}, {_id:513, properties:{id:"Kern-Ho Park"}}, {_id:514, properties:{id:"Sang Kyu Kwak"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:515, properties:{id:"A. Reum Ha"}}, {_id:516, properties:{id:"J. E. Lee"}}, {_id:517, properties:{id:"Hyun-Wook Lee"}}, {_id:529, properties:{id:"R. Yuge"}}, {_id:530, properties:{id:"T. Leichtweiss"}}, {_id:531, properties:{id:"S. Wang"}}, {_id:533, properties:{id:"J. Janek"}}, {_id:534, properties:{id:"A. Banerjee"}}, {_id:535, properties:{id:"B. Jin"}}, {_id:536, properties:{id:"M. Reich"}}, {_id:537, properties:{id:"D. H. S. Tan"}}, {_id:538, properties:{id:"T. Manako"}}, {_id:539, properties:{id:"Y. Xia"}}, {_id:540, properties:{id:"Naoki Suzuki"}}, {_id:542, properties:{id:"S. Wenzel"}}, {_id:543, properties:{id:"C. Vieider"}}, {_id:545, properties:{id:"M. Keller"}}, {_id:547, properties:{id:"M. R. Busche"}}, {_id:548, properties:{id:"C. Liang"}}, {_id:551, properties:{id:"M. Schneider"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:552, properties:{id:"X. He"}}, {_id:553, properties:{id:"A. Just"}}, {_id:554, properties:{id:"K. Nakano"}}, {_id:556, properties:{id:"Miyashita"}}, {_id:557, properties:{id:"L. Li"}}, {_id:558, properties:{id:"Yuichi Aihara"}}, {_id:559, properties:{id:"J. Sann"}}, {_id:560, properties:{id:"W. J. Evans"}}, {_id:561, properties:{id:"D. A. Weber"}}, {_id:563, properties:{id:"X. Wang"}}, {_id:564, properties:{id:"J. Schnell"}}, {_id:565, properties:{id:"T. Knoche"}}, {_id:566, properties:{id:"J. Yang"}}, {_id:567, properties:{id:"C. Zheng"}}, {_id:568, properties:{id:"M. S. Dresselhaus"}}, {_id:569, properties:{id:"X. Tao"}}, {_id:570, properties:{id:"B. Wu"}}, {_id:571, properties:{id:"K. W. Kim"}}, {_id:572, properties:{id:"W. Zhang"}}, {_id:574, properties:{id:"P. Adelhelm"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:576, properties:{id:"D. Z. Deng"}}, {_id:577, properties:{id:"H. Nguyen"}}, {_id:579, properties:{id:"K. Nakahara"}}, {_id:580, properties:{id:"J. Zhang"}}, {_id:581, properties:{id:"Y. Gan"}}, {_id:583, properties:{id:"J. M. Doux"}}, {_id:584, properties:{id:"N. Tamura"}}, {_id:586, properties:{id:"P. Hartmann"}}, {_id:589, properties:{id:"S. Passerini"}}, {_id:590, properties:{id:"H. Huang"}}, {_id:591, properties:{id:"G. Reinhart"}}, {_id:592, properties:{id:"J. Shi"}}, {_id:593, properties:{id:"Akiko Tsurumaki"}}, {_id:594, properties:{id:"Maria Assunta Navarra"}}, {_id:595, properties:{id:"H. B. Gu"}}, {_id:596, properties:{id:"T. Günther"}}, {_id:598, properties:{id:"E. A. Wu"}}, {_id:601, properties:{id:"Tomoyuki Tsujimura"}}, {_id:603, properties:{id:"Giovanna Maresca"}}, {_id:604, properties:{id:"J. Xiao"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:605, properties:{id:"Y. S. Meng"}}, {_id:606, properties:{id:"L. Köhler"}}, {_id:607, properties:{id:"Y. Yang"}}, {_id:608, properties:{id:"Bingyu Ke"}}, {_id:609, properties:{id:"Haoshen Zhou"}}, {_id:610, properties:{id:"Haoyu Li"}}, {_id:611, properties:{id:"Shaohua Guo"}}, {_id:613, properties:{id:"Tao Yu"}}, {_id:615, properties:{id:"Yonghua Du"}}, {_id:620, properties:{id:"Feng Wang"}}, {_id:622, properties:{id:"Shinjae Yoo"}}, {_id:625, properties:{id:"Cem Komurcuoglu"}}, {_id:626, properties:{id:"Sizhan Liu"}}, {_id:627, properties:{id:"Jagriti S. Shekhawat"}}, {_id:631, properties:{id:"Matthew R. Carbone"}}, {_id:632, properties:{id:"Conan Weiland"}}, {_id:633, properties:{id:"Daniel A. Steingart"}}, {_id:634, properties:{id:"Ke Chen"}}, {_id:635, properties:{id:"Alexander Urban"}}, {_id:637, properties:{id:"Kerry Sun"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:641, properties:{id:"Seong-Min Bak"}}, {_id:646, properties:{id:"Haoyue Guo"}}, {_id:647, properties:{id:"Deyu Lu"}}, {_id:649, properties:{id:"Chuntian Cao"}}, {_id:650, properties:{id:"Xiao Tong"}}, {_id:654, properties:{id:"Nongnuch Artrith"}}, {_id:657, properties:{id:"Jinliang Li"}}, {_id:659, properties:{id:"William T. Nichols"}}, {_id:672, properties:{id:"Sungwoo Noh"}}, {_id:692, properties:{id:"Moonju Cho"}}, {_id:714, properties:{id:"Dongwook Shin"}}, {_id:730, properties:{id:"Jinghua Wu"}}, {_id:747, properties:{id:"Mengli Yang"}}, {_id:752, properties:{id:"Ruru Meng"}}, {_id:756, properties:{id:"Fuli Tian"}}, {_id:758, properties:{id:"Wenrui Xie"}}, {_id:771, properties:{id:"Xiayin Yao"}}, {_id:773, properties:{id:"Mengting Zhu"}}, {_id:776, properties:{id:"She-Huang Wu"}}, {_id:777, properties:{id:"Yosef Nikodimos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:778, properties:{id:"Chen-Jui Huang"}}, {_id:780, properties:{id:"Bereket Woldegbreal Taklu"}}, {_id:784, properties:{id:"Wei-Nien Su"}}, {_id:785, properties:{id:"Kassie Nigus Shitaw"}}, {_id:786, properties:{id:"Misganaw Adigo Weret"}}, {_id:792, properties:{id:"Shi-Kai Jiang"}}, {_id:795, properties:{id:"Sheng-Chiang Yang"}}, {_id:802, properties:{id:"Bing Joe Hwang"}}, {_id:804, properties:{id:"Keseven Lakshmanan"}}, {_id:805, properties:{id:"Nigusu Tiruneh Temesgen"}}, {_id:806, properties:{id:"Hailemariam Kassa Bezabh"}}, {_id:808, properties:{id:"X. Li"}}, {_id:809, properties:{id:"Y. Zhao"}}, {_id:810, properties:{id:"C. Wang"}}, {_id:811, properties:{id:"M. Zheng"}}, {_id:812, properties:{id:"X. Sun"}}, {_id:813, properties:{id:"Andrea Itziar Pitillas Martinez"}}, {_id:816, properties:{id:"Pedro López-Aranguren"}}, {_id:825, properties:{id:"Ville Kekkonen"}}, {_id:827, properties:{id:"Alexander Beutl"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:828, properties:{id:"Ander Orue"}}, {_id:831, properties:{id:"Artur Tron"}}, {_id:834, properties:{id:"Maria Helena Braga"}}, {_id:843, properties:{id:"吕璐"}}, {_id:848, properties:{id:"Sharafi, A."}}, {_id:849, properties:{id:"Doux, J.-M."}}, {_id:854, properties:{id:"Kitaura, H."}}, {_id:857, properties:{id:"Misae Otoyama"}}, {_id:858, properties:{id:"Hiroe Kowada"}}, {_id:860, properties:{id:"McDonald, J. E."}}, {_id:862, properties:{id:"Minako Deguchi"}}, {_id:865, properties:{id:"Kim, K. J."}}, {_id:867, properties:{id:"Suyama, M."}}, {_id:873, properties:{id:"Eiji Hosono"}}, {_id:877, properties:{id:"Hirokazu Kitaura"}}, {_id:880, properties:{id:"Liu, X."}}, {_id:885, properties:{id:"Kentaro Kuratani"}}, {_id:886, properties:{id:"Motoshi Suyama"}}, {_id:887, properties:{id:"Ye, L."}}, {_id:888, properties:{id:"Kato, A."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:890, properties:{id:"Cui, W."}}, {_id:891, properties:{id:"Raj, V."}}, {_id:897, properties:{id:"Tomonari Takeuchi"}}, {_id:902, properties:{id:"Prof. Chunsheng Wang"}}, {_id:909, properties:{id:"Dr. Fudong Han"}}, {_id:913, properties:{id:"Ruochen Xu"}}, {_id:917, properties:{id:"Dr. Xiulin Fan"}}, {_id:919, properties:{id:"Xiao Ji"}}, {_id:920, properties:{id:"Prof. Jiangping Tu"}}, {_id:992, properties:{id:"I. V. Yentekakis"}}, {_id:995, properties:{id:"K. Eguchi"}}, {_id:996, properties:{id:"T. A. Lin"}}, {_id:997, properties:{id:"Thomas J. Kirk"}}, {_id:998, properties:{id:"T. Setoguchi"}}, {_id:999, properties:{id:"A. E Sammells"}}, {_id:1000, properties:{id:"Y. Baba"}}, {_id:1001, properties:{id:"H. Arai"}}, {_id:1002, properties:{id:"K. Ogaki"}}, {_id:1003, properties:{id:"C. G. Vayenas"}}, {_id:1004, properties:{id:"H. Ushida"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1006, properties:{id:"D. Eng"}}, {_id:1007, properties:{id:"M. Stoudikes"}}, {_id:1008, properties:{id:"N. U. Pujare"}}, {_id:1009, properties:{id:"T. Esaka"}}, {_id:1010, properties:{id:"D. M. Mason"}}, {_id:1012, properties:{id:"K. J. Tsai"}}, {_id:1013, properties:{id:"T. Yajima"}}, {_id:1014, properties:{id:"R. Gerhardt-Anderson"}}, {_id:1015, properties:{id:"T. Inoue"}}, {_id:1016, properties:{id:"H. Yahiro"}}, {_id:1017, properties:{id:"A. Robbart"}}, {_id:1018, properties:{id:"K. Ono"}}, {_id:1019, properties:{id:"B. G. Ong"}}, {_id:1020, properties:{id:"H. Iwahara"}}, {_id:1021, properties:{id:"A. S. Nowick"}}, {_id:1022, properties:{id:"Jack Winnick"}}, {_id:1023, properties:{id:"P. Chiang"}}, {_id:1024, properties:{id:"N. Maeda"}}, {_id:1026, properties:{id:"H. Alqahtany"}}, {_id:1027, properties:{id:"H. Uchida"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1028, properties:{id:"C. Yu"}}, {_id:1029, properties:{id:"T. K. Schwietert"}}, {_id:1030, properties:{id:"R. Koerver"}}, {_id:1031, properties:{id:"Zhong Fang"}}, {_id:1032, properties:{id:"X. Miao"}}, {_id:1033, properties:{id:"M. Wagemaker"}}, {_id:1034, properties:{id:"F. C. Ren"}}, {_id:1035, properties:{id:"J. Zhu"}}, {_id:1036, properties:{id:"W. Liang"}}, {_id:1037, properties:{id:"Z. He"}}, {_id:1038, properties:{id:"S. Dong"}}, {_id:1039, properties:{id:"X. Yu"}}, {_id:1040, properties:{id:"M. Yu"}}, {_id:1041, properties:{id:"G. Hartley"}}, {_id:1042, properties:{id:"Z. Hu"}}, {_id:1043, properties:{id:"J. Xie"}}, {_id:1044, properties:{id:"L. J. Miara"}}, {_id:1045, properties:{id:"Yu Zhang"}}, {_id:1046, properties:{id:"J. Luo"}}, {_id:1047, properties:{id:"S.-H. Bo"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1048, properties:{id:"L. Wang"}}, {_id:1049, properties:{id:"Ming Shen"}}, {_id:1050, properties:{id:"Yonggang Wang"}}, {_id:1051, properties:{id:"J. Kasemchainan"}}, {_id:1052, properties:{id:"S. J. Sedlmaier"}}, {_id:1053, properties:{id:"Bingwen Hu"}}, {_id:1054, properties:{id:"B. Zheng"}}, {_id:1055, properties:{id:"Y. Wang"}}, {_id:1056, properties:{id:"E. van der Maas"}}, {_id:1057, properties:{id:"F. H. Richter"}}, {_id:1058, properties:{id:"V. Viallet"}}, {_id:1059, properties:{id:"T. Leichtweiß"}}, {_id:1060, properties:{id:"G. F. Dewald"}}, {_id:1061, properties:{id:"E. Cakmak"}}, {_id:1062, properties:{id:"H. Ren"}}, {_id:1063, properties:{id:"T. Sasaki"}}, {_id:1064, properties:{id:"R. Dedryvère"}}, {_id:1065, properties:{id:"Y. L. Xu"}}, {_id:1066, properties:{id:"Fei Wang"}}, {_id:1067, properties:{id:"S. Ganapathy"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1068, properties:{id:"H. Higuchi"}}, {_id:1069, properties:{id:"R. Xie"}}, {_id:1070, properties:{id:"S. G. Sun"}}, {_id:1071, properties:{id:"W. Zhao"}}, {_id:1072, properties:{id:"T. Hupfer"}}, {_id:1073, properties:{id:"Y. Zhou"}}, {_id:1074, properties:{id:"T.-S. Chan"}}, {_id:1075, properties:{id:"L. Y. Zeng"}}, {_id:1076, properties:{id:"N. J. J. de Klerk"}}, {_id:1077, properties:{id:"P. F. Yan"}}, {_id:1078, properties:{id:"J. Zhao"}}, {_id:1079, properties:{id:"Y. Xiang"}}, {_id:1080, properties:{id:"C. Xie"}}, {_id:1081, properties:{id:"J. Liu"}}, {_id:1082, properties:{id:"S. Cheng"}}, {_id:1083, properties:{id:"N. M. Vargas-Barbosa"}}, {_id:1084, properties:{id:"J.-G. Zhang"}}, {_id:1085, properties:{id:"P. Till"}}, {_id:1086, properties:{id:"S. Zekoll"}}, {_id:1087, properties:{id:"G. Zhong"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1088, properties:{id:"L. Zhang"}}, {_id:1089, properties:{id:"L. Peng"}}, {_id:1090, properties:{id:"Z. Ning"}}, {_id:1091, properties:{id:"J. T. Li"}}, {_id:1092, properties:{id:"M. Senga"}}, {_id:1093, properties:{id:"V. A. Arszelewska"}}, {_id:1094, properties:{id:"G. Ceder"}}, {_id:1095, properties:{id:"P. Bruce"}}, {_id:1096, properties:{id:"Yihua Xie"}}, {_id:1098, properties:{id:"A. Cassel"}}, {_id:1099, properties:{id:"Taoyi Kong"}}, {_id:1100, properties:{id:"D. Spencer Jolly"}}, {_id:1101, properties:{id:"Y. Xiao"}}, {_id:1102, properties:{id:"X. Y. Yao"}}, {_id:1103, properties:{id:"A. Vasileiadis"}}, {_id:1104, properties:{id:"J. Hageman"}}, {_id:1105, properties:{id:"X. Liu"}}, {_id:1106, properties:{id:"C. W. Wang"}}, {_id:1107, properties:{id:"Q. Li"}}, {_id:1108, properties:{id:"C. Dietrich"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1109, properties:{id:"D. Cao"}}, {_id:1110, properties:{id:"W. D. Zhang"}}, {_id:1111, properties:{id:"E. M. Kelder"}}, {_id:1112, properties:{id:"S. Ozcan"}}, {_id:1113, properties:{id:"C. Xu"}}, {_id:1114, properties:{id:"I. Aygün"}}, {_id:1115, properties:{id:"J. Ma"}}, {_id:1116, properties:{id:"Y. Seino"}}, {_id:1117, properties:{id:"Y. Su"}}, {_id:1118, properties:{id:"S. Ohno"}}, {_id:1119, properties:{id:"G. Cui"}}, {_id:1120, properties:{id:"I. Kerkamm"}}, {_id:1121, properties:{id:"M. Nakagawa"}}, {_id:1122, properties:{id:"Z. Liang"}}, {_id:1123, properties:{id:"K. Zhou"}}, {_id:1124, properties:{id:"J. Huang"}}, {_id:1125, properties:{id:"X. D. Zhou"}}, {_id:1126, properties:{id:"T. Marrow"}}, {_id:1127, properties:{id:"S. Chen"}}, {_id:1128, properties:{id:"S. J. Zhang"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1129, properties:{id:"V. Seznec"}}, {_id:1130, properties:{id:"H. Zhu"}}, {_id:1131, properties:{id:"Wuliang Feng"}}, {_id:1132, properties:{id:"Xing Zhou"}}, {_id:1133, properties:{id:"K. Takada"}}, {_id:1134, properties:{id:"J. Auvergniot"}}, {_id:1135, properties:{id:"M. H. Zou"}}, {_id:1136, properties:{id:"J. O. Binder"}}, {_id:1137, properties:{id:"X. Zhao"}}, {_id:1138, properties:{id:"A. Anderson"}}, {_id:1139, properties:{id:"J.-B. Ledeuil"}}, {_id:1140, properties:{id:"M. A. Kraft"}}, {_id:1142, properties:{id:"L. Chen"}}, {_id:1143, properties:{id:"Z. Gong"}}, {_id:1144, properties:{id:"H. Wang"}}, {_id:1145, properties:{id:"L. Huang"}}, {_id:1146, properties:{id:"B. Chen"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:956, properties:{id:"C-rate performance"}}, {_id:958, properties:{id:"The cycle performance"}}, {_id:977, properties:{id:"C-rate and cycling performance"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Performance;
UNWIND [{_id:814, properties:{id:"round-robin test"}}, {_id:815, properties:{id:"all-solid-state battery"}}, {_id:817, properties:{id:"coin cell"}}, {_id:821, properties:{id:"Li6PS5Cl"}}, {_id:826, properties:{id:"NMC90505"}}, {_id:835, properties:{id:"solid-state battery"}}, {_id:837, properties:{id:"NMC"}}, {_id:838, properties:{id:"sulfide solid electrolyte"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Concept;
UNWIND [{_id:735, properties:{id:"reduced electrolyte degradation"}}, {_id:736, properties:{id:"improved charge transfer kinetics"}}, {_id:739, properties:{id:"high electronic conductivity"}}, {_id:760, properties:{id:"enhanced lithium diffusion kinetics"}}, {_id:765, properties:{id:"high capacity retention"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Characteristic;
UNWIND [{_id:661, properties:{id:"Electrochemical impedance spectroscopy"}}, {_id:688, properties:{id:"electrochemical measurements"}}, {_id:689, properties:{id:"Scanning electron microscopy"}}, {_id:698, properties:{id:"Electrochemical measurements"}}, {_id:704, properties:{id:"electrochemical impedance spectroscopy"}}, {_id:706, properties:{id:"EDX point analysis"}}, {_id:713, properties:{id:"lithium ion conductivity measurements"}}, {_id:717, properties:{id:"scanning electron microscopy"}}, {_id:790, properties:{id:"Raman experiment"}}, {_id:796, properties:{id:"XRD"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Experiment;
UNWIND [{_id:969, properties:{id:"a rate of 0.1, 0.2, 0.5, 1.0, and again 0.1 C"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Rate;
UNWIND [{_id:8, properties:{id:"Liquid-involved synthesis and processing of sulfide-based solid electrolytes"}}, {_id:12, properties:{id:"Liquid-phase synthesis"}}, {_id:13, properties:{id:"Solution process"}}, {_id:17, properties:{id:"Slurry process"}}, {_id:731, properties:{id:"DFT calculations"}}, {_id:737, properties:{id:"Raman spectrophotometer"}}, {_id:738, properties:{id:"carbon sulfur analyzer"}}, {_id:741, properties:{id:"transmission electron microscopy"}}, {_id:742, properties:{id:"electrochemical impedance spectroscopy"}}, {_id:743, properties:{id:"galvanostatic discharge-charge curves"}}, {_id:746, properties:{id:"projector augmented wave method"}}, {_id:749, properties:{id:"field emission scanning electron microscopy"}}, {_id:751, properties:{id:"direct current polarization measurement"}}, {_id:753, properties:{id:"X-ray diffraction"}}, {_id:759, properties:{id:"scanning transmission electron microscope-energy dispersive spectroscopy"}}, {_id:762, properties:{id:"Randles-Sevcik equation"}}, {_id:764, properties:{id:"Perdew-Burke-Ernzerhof generalized gradient approximation"}}, {_id:770, properties:{id:"cyclic voltammetry"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Method;
UNWIND [{_id:680, properties:{id:"Seoul"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:City;
UNWIND [{_id:29, properties:{id:"Zhao et al."}}, {_id:847, properties:{id:"High-Temperature Performance of All- Solid-State Lithium-Metal Batteries Having Li/Li3PS4 Interfaces Modified with Au Thin Films. J. Electrochem. Soc. 2018, 165, A1950− A1954."}}, {_id:850, properties:{id:"Surface Chemistry Mechanism of Ultra-Low Interfacial Resistance in the Solid-State Electrolyte Li7La3Zr2O12. Chem. Mater. 2017, 29, 7961−7968."}}, {_id:851, properties:{id:"Direct Correlation between Void Formation and Lithium Dendrite Growth in Solid-State Electrolytes with Interlayers. Nat. Mater. 2022, 21, 1050−1056."}}, {_id:853, properties:{id:"Solid-State Li−Metal Batteries: Challenges and Horizons of Oxide and Sulfide Solid Electrolytes and Their Interfaces. Adv. Energy Mater. 2021, 11, No. 2002689."}}, {_id:855, properties:{id:"Ultrasonic-Assisted Brazing of Sapphire with High Strength Al−4.5Cu−1.5Mg Alloy. Ceram. Int. 2015, 41, 8014−8022."}}, {_id:856, properties:{id:"High Lithium Ion Conducting Glass-Ceramics in the System Li2S−P2S5. Solid State Ionics 2006, 177, 2721−2725."}}, {_id:861, properties:{id:"A Sulphide Lithium Super Ion Conductor Is Superior to Liquid Ion Conductors for Use in Rechargeable Batteries. Energy Environ. Sci. 2014, 7, 627−631."}}, {_id:866, properties:{id:"Local Electronic Structure Variation Resulting in Li ‘Filament’ Formation within Solid Electrolytes. Nat. Mater. 2021, 20, 1485−1490."}}, {_id:868, properties:{id:"Electrochemical Analysis of Li4Ti5O12 Electrode in All-Solid-State Lithium Secondary Batteries. J. Electrochem. Soc. 2008, 156, A114."}}, {_id:869, properties:{id:"Lithium Dissolution/Deposition Behavior with Li3PS4-LiI Electrolyte for All-Solid-State Batteries Operating at High Temperatures. Electro- chim. Acta 2018, 286, 158−162."}}, {_id:870, properties:{id:"All-Solid-State Battery Electrode Sheets Prepared by a Slurry Coating Process. J. Electrochem. Soc. 2017, 164, A2474−A2478."}}, {_id:872, properties:{id:"Adhesion in Aluminum Oxide- Metal System. Trans. Metall. Soc. AIME 1965, 233, 512−517."}}, {_id:874, properties:{id:"Li10Si0.3Sn0.7P2S12 − A Low-Cost and Low-Grain-Boundary-Resistance Lithium Superionic Conductor. J. Power Sources 2016, 329, 530−535."}}, {_id:876, properties:{id:"Fabrication of Favorable Interface between Sulfide Solid Electrolyte and Li Metal Electrode for Bulk-Type Solid-State Li/S Battery. Electrochem. Commun. 2012, 22, 177−180."}}, {_id:878, properties:{id:"New, Highly Ion-Conductive Crystals Precipitated from Li2S−P2S5 Glasses. Adv. Mater. 2005, 17, 918−921."}}, {_id:879, properties:{id:"Stack Pressure Considerations for Room-Temperature All-Solid-State Lithium Metal Batteries. Adv. Energy Mater. 2020, 10, No. 1903253."}}, {_id:883, properties:{id:"Evaluation of Elastic Modulus of Li2S−P2S5 Glassy Solid Electrolyte by Ultrasonic Sound Velocity Measurement and Compression Test. J. Ceram. Soc. Jpn. 2013, 121, 946−949."}}, {_id:892, properties:{id:"Preparation of Li2S−P2S5 Amorphous Solid Electrolytes by Mechanical Milling. J. Am. Ceram. Soc. 2004, 84, 477−479."}}, {_id:893, properties:{id:"XPS and SEM Analysis between Li/Li3PS4 Interface with Au Thin Film for All-Solid-State Lithium Batteries. Solid State Ionics 2018, 322, 1−4."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Publication;
UNWIND [{_id:894, properties:{id:"A Lithium Superionic Conductor. Nat. Mater. 2011, 10, 682−686."}}, {_id:895, properties:{id:"A Dynamic Stability Design Strategy for Lithium Metal Solid State Batteries. Nature 2021, 593, 218−222."}}, {_id:896, properties:{id:"High-Power All-Solid-State Batteries Using Sulfide Superionic Conductors. Nat. Energy 2016, 1, 16030."}}, {_id:900, properties:{id:"Importance of Li-Metal/Sulfide Electrolyte Interphase Ionic Conductivity in Suppressing Short-Circuiting of All-Solid-State Li-Metal Batteries. J. Electrochem. Soc. 2021, 168, No. 060542."}}, {_id:901, properties:{id:"An Ultrafast Process for the Fabrication of a Li Metal−Inorganic Solid Electrolyte Interface. Energy Environ. Sci. 2021, 14, 4474−4480."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Publication;
UNWIND [{_id:903, properties:{id:"Battery Research"}}, {_id:904, properties:{id:"Li Ion Battery Research"}}, {_id:906, properties:{id:"Energy Storage and Conversion Devices"}}, {_id:908, properties:{id:"Solid Electrolytes"}}, {_id:915, properties:{id:"All-Solid-State Lithium-Ion Batteries"}}, {_id:916, properties:{id:"First-Principles Calculations"}}, {_id:921, properties:{id:"Nanocomposites and Nanocomposite Coatings"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:`Research Area`;
UNWIND [{_id:927, properties:{id:"100 cycles at a rate of 0.3 and 0.5 C, respectively"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Cycle;
UNWIND [{_id:935, properties:{id:"a pressure of 300 MPa for 1 min"}}, {_id:947, properties:{id:"A pressure of 100 MPa"}}, {_id:983, properties:{id:"applying a pres- sure of 300 MPa for 1 min"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Pressure;
UNWIND [{_id:889, properties:{id:"+81-298615331"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Phone;
UNWIND [{_id:488, properties:{id:"Gibbs energy"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Energy;
UNWIND [{_id:491, properties:{id:"Korea Electronics Technology Institute"}}, {_id:624, properties:{id:"Debye Institute for Nanomaterials Science"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Institute;
UNWIND [{_id:946, properties:{id:"a weight ratio of 75:22:3"}}, {_id:948, properties:{id:"LPSCl in a 1:1 volume ratio"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Ratio;
UNWIND [{_id:50, properties:{id:"sensing characteristics"}}, {_id:59, properties:{id:"chemical stability and ionic conductivity"}}, {_id:60, properties:{id:"sensing properties"}}, {_id:65, properties:{id:"better sensing performance and stability"}}, {_id:284, properties:{id:"high ionic conductivity"}}, {_id:289, properties:{id:"low Young's modulus"}}, {_id:290, properties:{id:"high electronic conductivity"}}, {_id:291, properties:{id:"stable interface"}}, {_id:293, properties:{id:"unstable interface"}}, {_id:296, properties:{id:"high Young's modulus"}}, {_id:299, properties:{id:"low ionic conductivity"}}, {_id:674, properties:{id:"Lithium ion conductivity"}}, {_id:681, properties:{id:"microstructures"}}, {_id:707, properties:{id:"Microstructures"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Property;
UNWIND [{_id:660, properties:{id:"Conductive carbon"}}, {_id:669, properties:{id:"Solid electrolytes"}}, {_id:673, properties:{id:"Solid electrolyte"}}, {_id:685, properties:{id:"solid electrolytes"}}, {_id:690, properties:{id:"Anode layers"}}, {_id:694, properties:{id:"anode layers"}}, {_id:697, properties:{id:"Active cathode materials"}}, {_id:700, properties:{id:"current collectors"}}, {_id:703, properties:{id:"Composite cathode"}}, {_id:715, properties:{id:"Active particles"}}, {_id:727, properties:{id:"active cathode materials"}}, {_id:728, properties:{id:"composite cathode"}}, {_id:729, properties:{id:"Current collectors"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Component;
UNWIND [{_id:41, properties:{id:"Korea Institute of Energy Technology Evaluation and Planning"}}, {_id:61, properties:{id:"Department of Applied Chemistry, Faculty of Engineering, Kyushu Institute of Technology"}}, {_id:83, properties:{id:"Korea Institute of Science and Technology"}}, {_id:90, properties:{id:"Korea Evaluation Institute of Industrial Technology"}}, {_id:95, properties:{id:"National Research Foundation of Korea ICT"}}, {_id:159, properties:{id:"School of Energy and Chemical Engineering, Department of Energy Engineering, and Materials Engineering"}}, {_id:163, properties:{id:"Ulsan National Institute of Science and Technology (UNIST)"}}, {_id:219, properties:{id:"Advanced Batteries Research Center, Korea Electronics Technology Institute (KETI)"}}, {_id:232, properties:{id:"Power Control Device Research Team, Electronics and Telecommunications Research Institute (ETRI)"}}, {_id:243, properties:{id:"Department Beijing Key Laboratory of Environmental Science and Engineer- ing"}}, {_id:247, properties:{id:"Beijing Institute of Technology"}}, {_id:248, properties:{id:"Wiley Online Library"}}, {_id:249, properties:{id:"Wiley-VCH GmbH"}}, {_id:252, properties:{id:"Guangdong Key Laboratory of Battery Safety"}}, {_id:255, properties:{id:"Guangzhou Institute of Energy Testing"}}, {_id:257, properties:{id:"University Of British Columbia"}}, {_id:260, properties:{id:"School of Materials Science and Engineering"}}, {_id:269, properties:{id:"Pacific Northwest National Laboratory"}}, {_id:272, properties:{id:"The Pennsylvania State University"}}, {_id:275, properties:{id:"Sigma-Aldrich"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:301, properties:{id:"Japan Science and Technology Agency (JST)"}}, {_id:306, properties:{id:"Russian Foundation for Basic Research"}}, {_id:353, properties:{id:"Fraunhofer Institute for Manufacturing Engineering and Automation IPA"}}, {_id:473, properties:{id:"University of Stuttgart"}}, {_id:614, properties:{id:"Department of Earth and Environmental Engineering"}}, {_id:616, properties:{id:"Department of Materials Science and Engineering"}}, {_id:618, properties:{id:"Materials Project"}}, {_id:619, properties:{id:"National Institute of Standards and Technology"}}, {_id:623, properties:{id:"Department of Chemical Engineering"}}, {_id:628, properties:{id:"Columbia Electrochemical Energy Center (CEEC)"}}, {_id:630, properties:{id:"Columbia University"}}, {_id:636, properties:{id:"Materials Chemistry and Catalysis"}}, {_id:643, properties:{id:"Interdisciplinary Science Department"}}, {_id:645, properties:{id:"Yonsei University"}}, {_id:648, properties:{id:"Brookhaven National Laboratory"}}, {_id:651, properties:{id:"Computational Science Initiative"}}, {_id:652, properties:{id:"Center for Functional Nanomaterials"}}, {_id:653, properties:{id:"National Synchrotron Light Source II"}}, {_id:676, properties:{id:"Hanyang University"}}, {_id:775, properties:{id:"Nano-electrochemistry Laboratory, Department of Chemical Engineering, National Taiwan University of Science and Technology"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:783, properties:{id:"Nano-electrochemistry laboratory, Graduate Institute of Applied Science and Technology, National Taiwan University of Science and Technology"}}, {_id:788, properties:{id:"Nano-electrochemistry Laboratory, Graduate Institute of Applied Science and Technology, National Taiwan University of Science and Technology"}}, {_id:797, properties:{id:"Sustainable Energy Development Center, National Taiwan University of Science and Technology"}}, {_id:799, properties:{id:"National Synchrotron Radiation Research Center (NSRRC)"}}, {_id:818, properties:{id:"Center for Cooperative Research on Alternative Energies (CIC energiGUNE)"}}, {_id:822, properties:{id:"Engineering Physics Department, Engineering Faculty, University of Porto"}}, {_id:823, properties:{id:"Pulsedeon Ltd"}}, {_id:829, properties:{id:"Austrian Institute of Technology GmbH"}}, {_id:830, properties:{id:"European Union’s Horizon Europe research and innovation programme"}}, {_id:836, properties:{id:"Avesta Battery & Energy Engineering (ABEE)"}}, {_id:852, properties:{id:"Research Institute of Electrochemical Energy, National Institute of Advanced Industrial Science and Technology (AIST), Ikeda, Osaka 563-8577, Japan"}}, {_id:863, properties:{id:"Department of Applied Chemistry, Graduate School of Engineering, Osaka Metropolitan University, Sakai, Osaka 599-8531, Japan"}}, {_id:871, properties:{id:"Research Institute for Energy Conservation, National Institute of Advanced Industrial Science and Technology (AIST), Tsukuba, Ibaraki 305-8568, Japan"}}, {_id:884, properties:{id:"Global Zero Emission Research Center, National Institute of Advanced Industrial Science and Technology (AIST), Tsukuba, Ibaraki 305-8569, Japan"}}, {_id:899, properties:{id:"National Institute of Advanced Industrial Science and Technology (AIST), Tsukuba, Ibaraki 305-8568, Japan"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:970, properties:{id:"25 °C within the potential range of 2.0–3.7 V (vs Li-In/Li+)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Temperature;
UNWIND [{_id:978, properties:{id:"All measurements"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Measurement;
UNWIND [{_id:47, properties:{id:"First-Principles Design of Highly Functional Sulfide Electrolyte Li10-xSnP2S12-xClx for All Solid-State Li-ion Battery Applications"}}, {_id:532, properties:{id:"Accepted Article"}}, {_id:839, properties:{id:"Advances in air stability of sulfide solid electrolytes with high ion conductivity"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Article;
UNWIND [{_id:70, properties:{id:"literature"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Source;
UNWIND [{_id:77, properties:{id:"sulfide–based ASSLB system"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:System;
UNWIND [{_id:709, properties:{id:"https://doi.org/10.1007/s10832-018-0129-y"}}, {_id:801, properties:{id:"www.elsevier.com/locate/jpowsour"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:URL;
UNWIND [{_id:779, properties:{id:"XPS experiments"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Experiments;
UNWIND [{_id:791, properties:{id:"original draft"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Draft;
UNWIND [{_id:918, properties:{id:"University of Maryland Outstanding Junior Researcher Award"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Award;
UNWIND [{_id:245, properties:{id:"2022"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Year;
UNWIND [{_id:578, properties:{id:"Ar-filled dry box"}}, {_id:587, properties:{id:"hydraulic press"}}, {_id:663, properties:{id:"S-4800"}}, {_id:664, properties:{id:"Energy-dispersive X-ray spectroscopy"}}, {_id:670, properties:{id:"Uniaxial press"}}, {_id:675, properties:{id:"Electrochemical impedance analyzer"}}, {_id:677, properties:{id:"EDX"}}, {_id:682, properties:{id:"Charge-discharge measurement device"}}, {_id:683, properties:{id:"TOSCAT-3100"}}, {_id:691, properties:{id:"Field emission scanning electron microscope"}}, {_id:701, properties:{id:"Impedance analyzer"}}, {_id:702, properties:{id:"impedance analyzer"}}, {_id:716, properties:{id:"energy-dispersive X-ray spectroscopy"}}, {_id:721, properties:{id:"Wonatech SP5"}}, {_id:723, properties:{id:"Wonatech mp5"}}, {_id:725, properties:{id:"electrochemical impedance analyzer"}}, {_id:726, properties:{id:"field emission scanning electron microscope"}}, {_id:744, properties:{id:"multi-channel potentiostat electrochemical workstation"}}, {_id:755, properties:{id:"multichannel battery test system"}}, {_id:763, properties:{id:"glovebox"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Equipment;
UNWIND [{_id:923, properties:{id:"Nexsa ThermoFisher Scientiﬁc, with an Al Kα X-ray source (1486.6 eV) operated at 72 W and a high-resolution analyzer with a 50-eV pass energy"}}, {_id:928, properties:{id:"ThermoFisher Scientiﬁc, Talos F200X"}}, {_id:951, properties:{id:"FE-SEM"}}, {_id:966, properties:{id:"in the frequency range of 10 MHz to 1 mHz using a VMP3 potentiostat (Biologic Science Instrument)"}}, {_id:974, properties:{id:"the WBCS3000Le32 (WonATech) testing system"}}, {_id:980, properties:{id:"ﬁeld emission transmis- sion electron microscope (FE-TEM)"}}, {_id:984, properties:{id:"Carl Zeiss, Gemini 560"}}, {_id:987, properties:{id:"ﬁeld emission scanning electron microscopy (FE-SEM)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Equipment;
UNWIND [{_id:734, properties:{id:"transition state"}}, {_id:754, properties:{id:"lithium ion diffusion coefficient"}}, {_id:757, properties:{id:"lithium diffusion barrier"}}, {_id:774, properties:{id:"cutoff energy"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Parameter;
UNWIND [{_id:665, properties:{id:"Microstructure model"}}, {_id:724, properties:{id:"microstructure model"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Model;
UNWIND [{_id:259, properties:{id:"China"}}, {_id:261, properties:{id:"Beijing 100081, China"}}, {_id:335, properties:{id:"Pfaffenwaldring 47, 70569 Stuttgart, Germany"}}, {_id:449, properties:{id:"Nobelstr. 12, 70569 Stuttgart, Germany"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Location;
UNWIND [{_id:485, properties:{id:"River Campus & Miner Libraries"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:`assistant<|end_header_id|>

The list of extracted entities and relations is too long to be displayed in this format. However`;
UNWIND [{_id:30, properties:{id:"manuscript"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Manuscript;
UNWIND [{_id:793, properties:{id:"study"}}, {_id:803, properties:{id:"Solvent-free design of argyrodite sulfide composite solid electrolyte with superb interface and moisture stability in anode-free lithium metal batteries"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Study;
UNWIND [{_id:832, properties:{id:"Grant/Award Number: 101069686"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Grant;
UNWIND [{_id:800, properties:{id:"experimental activities"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Activities;
UNWIND [{_id:311, properties:{id:"Elektrokhimiya, 2005, vol. 41, p. 633"}}, {_id:316, properties:{id:"Elektrokhimiya, 2005, vol. 41, p. 707"}}, {_id:317, properties:{id:"Vestn. St. Peterburg. Gos. Univ., Ser. 4: Fiz., Khim., 1997, issue 1, p. 64"}}, {_id:318, properties:{id:"Sb. Nauch. Tr. UTs RAN, 1991, p. 18"}}, {_id:320, properties:{id:"Zh. Prikl. Khim., 2000, vol. 73, p. 1324"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Reference;
UNWIND [{_id:950, properties:{id:"cross-sectional SEM samples of the cell"}}, {_id:979, properties:{id:"milled cross-sections"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sample;
UNWIND [{_id:487, properties:{id:"EMFs"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Measurements;
UNWIND [{_id:36, properties:{id:"Elsevier"}}, {_id:40, properties:{id:"Elsevier B.V."}}, {_id:319, properties:{id:"Pleiades Publishing, Ltd."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Publisher;
UNWIND [{_id:973, properties:{id:"a concentration of 3 wt.%"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Concentration;
UNWIND [{_id:4, properties:{id:"Li3PS4"}}, {_id:5, properties:{id:"polymeric binders"}}, {_id:6, properties:{id:"Li6PS5Br"}}, {_id:7, properties:{id:"Na2.9PS3.95Se0.05"}}, {_id:9, properties:{id:"Li3.25Ge0.25P0.75S4"}}, {_id:10, properties:{id:"Li10GeP2S12"}}, {_id:11, properties:{id:"Li7P3S11"}}, {_id:14, properties:{id:"Li6PS5I"}}, {_id:15, properties:{id:"Li2S"}}, {_id:16, properties:{id:"Li6PS5Cl"}}, {_id:18, properties:{id:"P2S5"}}, {_id:19, properties:{id:"Na4−xSn1−xSbxS4"}}, {_id:20, properties:{id:"Li4PS4I"}}, {_id:21, properties:{id:"Li7La3Zr2O12"}}, {_id:22, properties:{id:"sulfide-based solid electrolytes"}}, {_id:23, properties:{id:"carbon additives"}}, {_id:24, properties:{id:"Li1.4Al0.4Ti1.6(PO4)3"}}, {_id:25, properties:{id:"Li4SnS4"}}, {_id:26, properties:{id:"Na3PS4"}}, {_id:27, properties:{id:"Na3SbS4"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Material;
UNWIND [{_id:52, properties:{id:"metal-sulﬁde electrodes"}}, {_id:54, properties:{id:"alkali metal sulfates"}}, {_id:62, properties:{id:"metal-sulﬁdes"}}, {_id:63, properties:{id:"solid electrolyte type II"}}, {_id:64, properties:{id:"solid electrolyte-type SOx sensors"}}, {_id:66, properties:{id:"MoS2, Ag2S-MoSx"}}, {_id:67, properties:{id:"CdS"}}, {_id:69, properties:{id:"alkali sulfate-based electrolytes"}}, {_id:71, properties:{id:"Na5DySi4O12"}}, {_id:72, properties:{id:"NiS, CdS, SnS, PbS"}}, {_id:76, properties:{id:"Ni–rich layered oxide cathode materials"}}, {_id:87, properties:{id:"Li3PS4-LiBH4"}}, {_id:89, properties:{id:"Li3PS4-LiBH4-MgO"}}, {_id:91, properties:{id:"MgO"}}, {_id:93, properties:{id:"S"}}, {_id:94, properties:{id:"LiBH4"}}, {_id:96, properties:{id:"Li2O"}}, {_id:99, properties:{id:"Mg"}}, {_id:264, properties:{id:"1-Bromopentane"}}, {_id:268, properties:{id:"LiBr"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Material;
UNWIND [{_id:276, properties:{id:"LiI"}}, {_id:277, properties:{id:"Lithium7P2S8Br0.5I0.5"}}, {_id:283, properties:{id:"LiI-doped Li3PS4"}}, {_id:287, properties:{id:"LiBr-doped Li3PS4"}}, {_id:550, properties:{id:"LP30"}}, {_id:573, properties:{id:"MAG"}}, {_id:582, properties:{id:"SP"}}, {_id:599, properties:{id:"CF"}}, {_id:666, properties:{id:"Indium foil"}}, {_id:667, properties:{id:"sulfide solid electrolyte"}}, {_id:668, properties:{id:"Stainless steel disks"}}, {_id:678, properties:{id:"powders"}}, {_id:679, properties:{id:"electron conductive carbon"}}, {_id:684, properties:{id:"Electron conductive carbon"}}, {_id:693, properties:{id:"Sulfide solid electrolyte"}}, {_id:695, properties:{id:"Conductive carbon"}}, {_id:696, properties:{id:"96(78Li2S·22P2S5)·4Li2SO4"}}, {_id:705, properties:{id:"Solid electrolyte"}}, {_id:711, properties:{id:"solid electrolyte"}}, {_id:712, properties:{id:"Li2SO4"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Material;
UNWIND [{_id:719, properties:{id:"LiCoO2"}}, {_id:720, properties:{id:"Super P"}}, {_id:733, properties:{id:"Li6PS5Cl electrolyte"}}, {_id:748, properties:{id:"Li10GeP2S12 electrolyte"}}, {_id:766, properties:{id:"MoS2-C superlattice"}}, {_id:767, properties:{id:"MoS2"}}, {_id:768, properties:{id:"lithium foil"}}, {_id:922, properties:{id:"Ion-conductive polymers"}}, {_id:924, properties:{id:"the mixture of NCA and LPSCl"}}, {_id:925, properties:{id:"Li6PS5Cl (LPSCl)"}}, {_id:926, properties:{id:"electrode materials"}}, {_id:929, properties:{id:"cathode materials (NCA, LPSCl, and CNF with or without ICP)"}}, {_id:931, properties:{id:"LiNi0.95Co0.04Al0.01O2 (NCA)"}}, {_id:933, properties:{id:"NCA"}}, {_id:934, properties:{id:"Carbon nanoﬁber (CNF, thickness = 100 ոm, length = 20–200 μm)"}}, {_id:937, properties:{id:"NCA, LPSCl, and CNF"}}, {_id:938, properties:{id:"poly(ethylene oxide)-based ion-conductive polymer (PEO-ICP)"}}, {_id:939, properties:{id:"PPC-ICP (3 wt%)"}}, {_id:942, properties:{id:"PPC ion-conductive polymer"}}, {_id:943, properties:{id:"poly(propylene carbonate)-based ion-conductive polymer (PPC, Mw = 50 000; Sigma-Aldrich) and lithium bis(triﬂuoromethanesulfonyl) imide (LiTFSI, purity 99.95%; Sigma-Aldrich)"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Material;
UNWIND [{_id:949, properties:{id:"3 wt.% of ICP"}}, {_id:959, properties:{id:"sulﬁde-based cathodes"}}, {_id:960, properties:{id:"PEO"}}, {_id:961, properties:{id:"inorganic materials (lithium niobate and zirconia), polymeric rubbers (NBR and SBR), and PEO ion-conductive polymers"}}, {_id:964, properties:{id:"Lithium (purity 99.9%, thickness 20 μm) and indium foils (purity 99.9%, thickness 50 μm)"}}, {_id:968, properties:{id:"LPSCl powder with a particle size of 5 μm"}}, {_id:971, properties:{id:"All materials"}}, {_id:972, properties:{id:"LPSCl"}}, {_id:975, properties:{id:"Li-In ﬁlms"}}, {_id:981, properties:{id:"SUS foils (MTI Korea, 10 μm)"}}, {_id:988, properties:{id:"PPC-ICP"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Material;
UNWIND [{_id:55, properties:{id:"Solid-state electrochemical sensor devices combined with a sodium ion conductor (Na5DySi4O12) disc and metal-sulﬁde sensing electrodes synthesized via solution routes have been investigated for the detection of SO2 in the range 20–200 ppm at 150–400◦C."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Text;
UNWIND [{_id:305, properties:{id:"Determination of Diffusion Coefficients for Sulfide Ions in Solid"}}, {_id:994, properties:{id:"Abstract"}}, {_id:1011, properties:{id:"A Hydrogen Sulfide Solid-Oxide Fuel Cell Using Ceria-Based Electrolytes"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Title;
UNWIND [{_id:845, properties:{id:"*通讯作者, E-mail: chenrj@bit.edu.cn; wenyang@bit.edu.cn"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Contact;
UNWIND [{_id:354, properties:{id:"January 30, 2021"}}, {_id:402, properties:{id:"February 26, 2021"}}, {_id:438, properties:{id:"March 5, 2021"}}, {_id:794, properties:{id:"Available online 12 December 2022"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Date;
:commit
:begin
UNWIND [{start: {_id:668}, end: {_id:722}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:802}, end: {_id:793}, properties:{}}, {start: {_id:805}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONCEIVED]->(end) SET r += row.properties;
UNWIND [{start: {_id:991}, end: {_id:972}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTAINS]->(end) SET r += row.properties;
UNWIND [{start: {_id:242}, end: {_id:245}, properties:{}}, {start: {_id:246}, end: {_id:245}, properties:{}}, {start: {_id:251}, end: {_id:245}, properties:{}}, {start: {_id:253}, end: {_id:245}, properties:{}}, {start: {_id:254}, end: {_id:245}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:769}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:778}, end: {_id:800}, properties:{}}, {start: {_id:792}, end: {_id:800}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COORDINATED]->(end) SET r += row.properties;
UNWIND [{start: {_id:680}, end: {_id:676}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LOCATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:789}, properties:{}}, {start: {_id:784}, end: {_id:789}, properties:{}}, {start: {_id:802}, end: {_id:789}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:IDEA_GENERATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:78}, properties:{}}, {start: {_id:79}, end: {_id:79}, properties:{}}, {start: {_id:80}, end: {_id:80}, properties:{}}, {start: {_id:81}, end: {_id:81}, properties:{}}, {start: {_id:82}, end: {_id:82}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MATERIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:786}, end: {_id:30}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REVISED]->(end) SET r += row.properties;
UNWIND [{start: {_id:784}, end: {_id:793}, properties:{}}, {start: {_id:802}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING_ACQUISITION]->(end) SET r += row.properties;
UNWIND [{start: {_id:812}, end: {_id:464}, properties:{}}, {start: {_id:812}, end: {_id:808}, properties:{}}, {start: {_id:812}, end: {_id:809}, properties:{}}, {start: {_id:812}, end: {_id:810}, properties:{}}, {start: {_id:812}, end: {_id:811}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPERVISION]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:31}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROPOSED]->(end) SET r += row.properties;
UNWIND [{start: {_id:934}, end: {_id:930}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBTAINED_FROM]->(end) SET r += row.properties;
UNWIND [{start: {_id:814}, end: {_id:835}, properties:{}}, {start: {_id:815}, end: {_id:817}, properties:{}}, {start: {_id:817}, end: {_id:815}, properties:{}}, {start: {_id:821}, end: {_id:837}, properties:{}}, {start: {_id:826}, end: {_id:837}, properties:{}}, {start: {_id:835}, end: {_id:814}, properties:{}}, {start: {_id:837}, end: {_id:821}, properties:{}}, {start: {_id:838}, end: {_id:814}, properties:{}}, {start: {_id:838}, end: {_id:815}, properties:{}}, {start: {_id:838}, end: {_id:817}, properties:{}}, {start: {_id:838}, end: {_id:821}, properties:{}}, {start: {_id:838}, end: {_id:826}, properties:{}}, {start: {_id:838}, end: {_id:835}, properties:{}}, {start: {_id:838}, end: {_id:837}, properties:{}}, {start: {_id:838}, end: {_id:838}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RELATED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:294}, end: {_id:300}, properties:{}}, {start: {_id:297}, end: {_id:278}, properties:{}}, {start: {_id:302}, end: {_id:300}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WRITING]->(end) SET r += row.properties;
UNWIND [{start: {_id:84}, end: {_id:85}, properties:{}}, {start: {_id:84}, end: {_id:92}, properties:{}}, {start: {_id:84}, end: {_id:97}, properties:{}}, {start: {_id:84}, end: {_id:98}, properties:{}}, {start: {_id:85}, end: {_id:84}, properties:{}}, {start: {_id:85}, end: {_id:97}, properties:{}}, {start: {_id:85}, end: {_id:98}, properties:{}}, {start: {_id:92}, end: {_id:84}, properties:{}}, {start: {_id:92}, end: {_id:85}, properties:{}}, {start: {_id:92}, end: {_id:97}, properties:{}}, {start: {_id:92}, end: {_id:98}, properties:{}}, {start: {_id:97}, end: {_id:84}, properties:{}}, {start: {_id:97}, end: {_id:85}, properties:{}}, {start: {_id:97}, end: {_id:92}, properties:{}}, {start: {_id:97}, end: {_id:98}, properties:{}}, {start: {_id:98}, end: {_id:84}, properties:{}}, {start: {_id:98}, end: {_id:97}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DECLARE]->(end) SET r += row.properties;
UNWIND [{start: {_id:803}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TITLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:135}, end: {_id:506}, properties:{}}, {start: {_id:489}, end: {_id:506}, properties:{}}, {start: {_id:492}, end: {_id:43}, properties:{}}, {start: {_id:493}, end: {_id:43}, properties:{}}, {start: {_id:494}, end: {_id:43}, properties:{}}, {start: {_id:496}, end: {_id:506}, properties:{}}, {start: {_id:497}, end: {_id:43}, properties:{}}, {start: {_id:498}, end: {_id:506}, properties:{}}, {start: {_id:499}, end: {_id:506}, properties:{}}, {start: {_id:500}, end: {_id:506}, properties:{}}, {start: {_id:501}, end: {_id:43}, properties:{}}, {start: {_id:510}, end: {_id:506}, properties:{}}, {start: {_id:516}, end: {_id:43}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:486}, end: {_id:484}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:731}, properties:{}}, {start: {_id:766}, end: {_id:737}, properties:{}}, {start: {_id:766}, end: {_id:738}, properties:{}}, {start: {_id:766}, end: {_id:741}, properties:{}}, {start: {_id:766}, end: {_id:742}, properties:{}}, {start: {_id:766}, end: {_id:743}, properties:{}}, {start: {_id:766}, end: {_id:746}, properties:{}}, {start: {_id:766}, end: {_id:749}, properties:{}}, {start: {_id:766}, end: {_id:751}, properties:{}}, {start: {_id:766}, end: {_id:753}, properties:{}}, {start: {_id:766}, end: {_id:759}, properties:{}}, {start: {_id:766}, end: {_id:762}, properties:{}}, {start: {_id:766}, end: {_id:764}, properties:{}}, {start: {_id:766}, end: {_id:770}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:34}, end: {_id:36}, properties:{}}, {start: {_id:34}, end: {_id:40}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:269}, end: {_id:265}, properties:{}}, {start: {_id:272}, end: {_id:265}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:708}, end: {_id:676}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PART_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTAIN]->(end) SET r += row.properties;
UNWIND [{start: {_id:84}, end: {_id:83}, properties:{}}, {start: {_id:84}, end: {_id:90}, properties:{}}, {start: {_id:84}, end: {_id:95}, properties:{}}, {start: {_id:85}, end: {_id:83}, properties:{}}, {start: {_id:92}, end: {_id:83}, properties:{}}, {start: {_id:92}, end: {_id:90}, properties:{}}, {start: {_id:92}, end: {_id:95}, properties:{}}, {start: {_id:97}, end: {_id:83}, properties:{}}, {start: {_id:97}, end: {_id:90}, properties:{}}, {start: {_id:97}, end: {_id:95}, properties:{}}, {start: {_id:98}, end: {_id:83}, properties:{}}, {start: {_id:98}, end: {_id:90}, properties:{}}, {start: {_id:98}, end: {_id:95}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING]->(end) SET r += row.properties;
UNWIND [{start: {_id:285}, end: {_id:281}, properties:{}}, {start: {_id:295}, end: {_id:281}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVESTIGATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:319}, end: {_id:321}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:12}, end: {_id:4}, properties:{}}, {start: {_id:12}, end: {_id:5}, properties:{}}, {start: {_id:12}, end: {_id:6}, properties:{}}, {start: {_id:12}, end: {_id:7}, properties:{}}, {start: {_id:12}, end: {_id:9}, properties:{}}, {start: {_id:12}, end: {_id:10}, properties:{}}, {start: {_id:12}, end: {_id:11}, properties:{}}, {start: {_id:12}, end: {_id:14}, properties:{}}, {start: {_id:12}, end: {_id:15}, properties:{}}, {start: {_id:12}, end: {_id:16}, properties:{}}, {start: {_id:12}, end: {_id:18}, properties:{}}, {start: {_id:12}, end: {_id:19}, properties:{}}, {start: {_id:12}, end: {_id:20}, properties:{}}, {start: {_id:12}, end: {_id:21}, properties:{}}, {start: {_id:12}, end: {_id:23}, properties:{}}, {start: {_id:12}, end: {_id:24}, properties:{}}, {start: {_id:12}, end: {_id:25}, properties:{}}, {start: {_id:12}, end: {_id:26}, properties:{}}, {start: {_id:12}, end: {_id:27}, properties:{}}, {start: {_id:13}, end: {_id:4}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:13}, end: {_id:5}, properties:{}}, {start: {_id:13}, end: {_id:6}, properties:{}}, {start: {_id:13}, end: {_id:7}, properties:{}}, {start: {_id:13}, end: {_id:9}, properties:{}}, {start: {_id:13}, end: {_id:10}, properties:{}}, {start: {_id:13}, end: {_id:11}, properties:{}}, {start: {_id:13}, end: {_id:14}, properties:{}}, {start: {_id:13}, end: {_id:15}, properties:{}}, {start: {_id:13}, end: {_id:16}, properties:{}}, {start: {_id:13}, end: {_id:18}, properties:{}}, {start: {_id:13}, end: {_id:19}, properties:{}}, {start: {_id:13}, end: {_id:20}, properties:{}}, {start: {_id:13}, end: {_id:21}, properties:{}}, {start: {_id:13}, end: {_id:23}, properties:{}}, {start: {_id:13}, end: {_id:24}, properties:{}}, {start: {_id:13}, end: {_id:25}, properties:{}}, {start: {_id:13}, end: {_id:26}, properties:{}}, {start: {_id:13}, end: {_id:27}, properties:{}}, {start: {_id:17}, end: {_id:4}, properties:{}}, {start: {_id:17}, end: {_id:5}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:17}, end: {_id:6}, properties:{}}, {start: {_id:17}, end: {_id:7}, properties:{}}, {start: {_id:17}, end: {_id:9}, properties:{}}, {start: {_id:17}, end: {_id:10}, properties:{}}, {start: {_id:17}, end: {_id:11}, properties:{}}, {start: {_id:17}, end: {_id:14}, properties:{}}, {start: {_id:17}, end: {_id:15}, properties:{}}, {start: {_id:17}, end: {_id:16}, properties:{}}, {start: {_id:17}, end: {_id:18}, properties:{}}, {start: {_id:17}, end: {_id:19}, properties:{}}, {start: {_id:17}, end: {_id:20}, properties:{}}, {start: {_id:17}, end: {_id:21}, properties:{}}, {start: {_id:17}, end: {_id:23}, properties:{}}, {start: {_id:17}, end: {_id:24}, properties:{}}, {start: {_id:17}, end: {_id:25}, properties:{}}, {start: {_id:17}, end: {_id:26}, properties:{}}, {start: {_id:17}, end: {_id:27}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:902}, end: {_id:905}, properties:{}}, {start: {_id:920}, end: {_id:912}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROFESSOR_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:909}, end: {_id:915}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RESEARCH_FOCUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:988}, end: {_id:989}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PERFORMS]->(end) SET r += row.properties;
UNWIND [{start: {_id:285}, end: {_id:287}, properties:{}}, {start: {_id:302}, end: {_id:287}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:VALIDATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:64}, end: {_id:70}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REPORTED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:44}, end: {_id:42}, properties:{}}, {start: {_id:45}, end: {_id:42}, properties:{}}, {start: {_id:46}, end: {_id:42}, properties:{}}, {start: {_id:49}, end: {_id:42}, properties:{}}, {start: {_id:84}, end: {_id:86}, properties:{}}, {start: {_id:85}, end: {_id:86}, properties:{}}, {start: {_id:88}, end: {_id:86}, properties:{}}, {start: {_id:92}, end: {_id:86}, properties:{}}, {start: {_id:92}, end: {_id:190}, properties:{}}, {start: {_id:97}, end: {_id:86}, properties:{}}, {start: {_id:98}, end: {_id:86}, properties:{}}, {start: {_id:117}, end: {_id:184}, properties:{}}, {start: {_id:135}, end: {_id:184}, properties:{}}, {start: {_id:135}, end: {_id:190}, properties:{}}, {start: {_id:139}, end: {_id:184}, properties:{}}, {start: {_id:140}, end: {_id:184}, properties:{}}, {start: {_id:155}, end: {_id:184}, properties:{}}, {start: {_id:169}, end: {_id:184}, properties:{}}, {start: {_id:189}, end: {_id:184}, properties:{}}, {start: {_id:195}, end: {_id:184}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:196}, end: {_id:184}, properties:{}}, {start: {_id:199}, end: {_id:184}, properties:{}}, {start: {_id:213}, end: {_id:184}, properties:{}}, {start: {_id:234}, end: {_id:184}, properties:{}}, {start: {_id:239}, end: {_id:184}, properties:{}}, {start: {_id:239}, end: {_id:190}, properties:{}}, {start: {_id:242}, end: {_id:258}, properties:{}}, {start: {_id:246}, end: {_id:258}, properties:{}}, {start: {_id:251}, end: {_id:258}, properties:{}}, {start: {_id:253}, end: {_id:258}, properties:{}}, {start: {_id:254}, end: {_id:258}, properties:{}}, {start: {_id:262}, end: {_id:265}, properties:{}}, {start: {_id:263}, end: {_id:265}, properties:{}}, {start: {_id:266}, end: {_id:265}, properties:{}}, {start: {_id:267}, end: {_id:265}, properties:{}}, {start: {_id:270}, end: {_id:265}, properties:{}}, {start: {_id:271}, end: {_id:265}, properties:{}}, {start: {_id:273}, end: {_id:265}, properties:{}}, {start: {_id:274}, end: {_id:265}, properties:{}}, {start: {_id:280}, end: {_id:279}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:282}, end: {_id:279}, properties:{}}, {start: {_id:285}, end: {_id:279}, properties:{}}, {start: {_id:286}, end: {_id:279}, properties:{}}, {start: {_id:288}, end: {_id:279}, properties:{}}, {start: {_id:292}, end: {_id:279}, properties:{}}, {start: {_id:294}, end: {_id:279}, properties:{}}, {start: {_id:295}, end: {_id:279}, properties:{}}, {start: {_id:297}, end: {_id:279}, properties:{}}, {start: {_id:298}, end: {_id:279}, properties:{}}, {start: {_id:302}, end: {_id:279}, properties:{}}, {start: {_id:304}, end: {_id:321}, properties:{}}, {start: {_id:308}, end: {_id:321}, properties:{}}, {start: {_id:313}, end: {_id:321}, properties:{}}, {start: {_id:322}, end: {_id:321}, properties:{}}, {start: {_id:328}, end: {_id:321}, properties:{}}, {start: {_id:329}, end: {_id:321}, properties:{}}, {start: {_id:490}, end: {_id:190}, properties:{}}, {start: {_id:495}, end: {_id:190}, properties:{}}, {start: {_id:502}, end: {_id:190}, properties:{}}, {start: {_id:503}, end: {_id:190}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:504}, end: {_id:190}, properties:{}}, {start: {_id:505}, end: {_id:190}, properties:{}}, {start: {_id:507}, end: {_id:190}, properties:{}}, {start: {_id:508}, end: {_id:190}, properties:{}}, {start: {_id:513}, end: {_id:190}, properties:{}}, {start: {_id:514}, end: {_id:190}, properties:{}}, {start: {_id:515}, end: {_id:190}, properties:{}}, {start: {_id:516}, end: {_id:190}, properties:{}}, {start: {_id:517}, end: {_id:190}, properties:{}}, {start: {_id:529}, end: {_id:215}, properties:{}}, {start: {_id:530}, end: {_id:149}, properties:{}}, {start: {_id:530}, end: {_id:279}, properties:{}}, {start: {_id:531}, end: {_id:600}, properties:{}}, {start: {_id:533}, end: {_id:149}, properties:{}}, {start: {_id:534}, end: {_id:600}, properties:{}}, {start: {_id:535}, end: {_id:585}, properties:{}}, {start: {_id:536}, end: {_id:149}, properties:{}}, {start: {_id:537}, end: {_id:600}, properties:{}}, {start: {_id:538}, end: {_id:215}, properties:{}}, {start: {_id:539}, end: {_id:265}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:539}, end: {_id:562}, properties:{}}, {start: {_id:540}, end: {_id:258}, properties:{}}, {start: {_id:542}, end: {_id:279}, properties:{}}, {start: {_id:543}, end: {_id:215}, properties:{}}, {start: {_id:545}, end: {_id:215}, properties:{}}, {start: {_id:547}, end: {_id:149}, properties:{}}, {start: {_id:547}, end: {_id:279}, properties:{}}, {start: {_id:548}, end: {_id:265}, properties:{}}, {start: {_id:548}, end: {_id:562}, properties:{}}, {start: {_id:551}, end: {_id:149}, properties:{}}, {start: {_id:552}, end: {_id:265}, properties:{}}, {start: {_id:552}, end: {_id:562}, properties:{}}, {start: {_id:553}, end: {_id:215}, properties:{}}, {start: {_id:554}, end: {_id:215}, properties:{}}, {start: {_id:556}, end: {_id:546}, properties:{}}, {start: {_id:557}, end: {_id:265}, properties:{}}, {start: {_id:557}, end: {_id:562}, properties:{}}, {start: {_id:558}, end: {_id:258}, properties:{}}, {start: {_id:559}, end: {_id:149}, properties:{}}, {start: {_id:559}, end: {_id:279}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:560}, end: {_id:600}, properties:{}}, {start: {_id:561}, end: {_id:279}, properties:{}}, {start: {_id:563}, end: {_id:600}, properties:{}}, {start: {_id:564}, end: {_id:215}, properties:{}}, {start: {_id:565}, end: {_id:215}, properties:{}}, {start: {_id:566}, end: {_id:600}, properties:{}}, {start: {_id:567}, end: {_id:265}, properties:{}}, {start: {_id:567}, end: {_id:562}, properties:{}}, {start: {_id:568}, end: {_id:546}, properties:{}}, {start: {_id:569}, end: {_id:265}, properties:{}}, {start: {_id:569}, end: {_id:562}, properties:{}}, {start: {_id:570}, end: {_id:600}, properties:{}}, {start: {_id:571}, end: {_id:585}, properties:{}}, {start: {_id:572}, end: {_id:265}, properties:{}}, {start: {_id:572}, end: {_id:562}, properties:{}}, {start: {_id:574}, end: {_id:149}, properties:{}}, {start: {_id:576}, end: {_id:600}, properties:{}}, {start: {_id:577}, end: {_id:600}, properties:{}}, {start: {_id:579}, end: {_id:215}, properties:{}}, {start: {_id:580}, end: {_id:265}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:580}, end: {_id:562}, properties:{}}, {start: {_id:581}, end: {_id:265}, properties:{}}, {start: {_id:581}, end: {_id:562}, properties:{}}, {start: {_id:583}, end: {_id:600}, properties:{}}, {start: {_id:584}, end: {_id:215}, properties:{}}, {start: {_id:586}, end: {_id:149}, properties:{}}, {start: {_id:589}, end: {_id:215}, properties:{}}, {start: {_id:590}, end: {_id:265}, properties:{}}, {start: {_id:590}, end: {_id:562}, properties:{}}, {start: {_id:591}, end: {_id:215}, properties:{}}, {start: {_id:592}, end: {_id:215}, properties:{}}, {start: {_id:593}, end: {_id:258}, properties:{}}, {start: {_id:594}, end: {_id:258}, properties:{}}, {start: {_id:595}, end: {_id:585}, properties:{}}, {start: {_id:596}, end: {_id:215}, properties:{}}, {start: {_id:598}, end: {_id:600}, properties:{}}, {start: {_id:601}, end: {_id:258}, properties:{}}, {start: {_id:603}, end: {_id:258}, properties:{}}, {start: {_id:604}, end: {_id:600}, properties:{}}, {start: {_id:605}, end: {_id:600}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:606}, end: {_id:215}, properties:{}}, {start: {_id:607}, end: {_id:600}, properties:{}}, {start: {_id:608}, end: {_id:612}, properties:{}}, {start: {_id:609}, end: {_id:612}, properties:{}}, {start: {_id:610}, end: {_id:612}, properties:{}}, {start: {_id:611}, end: {_id:612}, properties:{}}, {start: {_id:613}, end: {_id:612}, properties:{}}, {start: {_id:615}, end: {_id:642}, properties:{}}, {start: {_id:620}, end: {_id:642}, properties:{}}, {start: {_id:622}, end: {_id:642}, properties:{}}, {start: {_id:625}, end: {_id:642}, properties:{}}, {start: {_id:626}, end: {_id:642}, properties:{}}, {start: {_id:627}, end: {_id:642}, properties:{}}, {start: {_id:631}, end: {_id:642}, properties:{}}, {start: {_id:632}, end: {_id:642}, properties:{}}, {start: {_id:633}, end: {_id:642}, properties:{}}, {start: {_id:634}, end: {_id:642}, properties:{}}, {start: {_id:635}, end: {_id:642}, properties:{}}, {start: {_id:637}, end: {_id:642}, properties:{}}, {start: {_id:641}, end: {_id:642}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:646}, end: {_id:642}, properties:{}}, {start: {_id:647}, end: {_id:642}, properties:{}}, {start: {_id:649}, end: {_id:642}, properties:{}}, {start: {_id:650}, end: {_id:642}, properties:{}}, {start: {_id:654}, end: {_id:642}, properties:{}}, {start: {_id:657}, end: {_id:655}, properties:{}}, {start: {_id:657}, end: {_id:656}, properties:{}}, {start: {_id:657}, end: {_id:658}, properties:{}}, {start: {_id:659}, end: {_id:686}, properties:{}}, {start: {_id:672}, end: {_id:686}, properties:{}}, {start: {_id:692}, end: {_id:686}, properties:{}}, {start: {_id:714}, end: {_id:686}, properties:{}}, {start: {_id:730}, end: {_id:732}, properties:{}}, {start: {_id:747}, end: {_id:732}, properties:{}}, {start: {_id:752}, end: {_id:732}, properties:{}}, {start: {_id:756}, end: {_id:732}, properties:{}}, {start: {_id:758}, end: {_id:732}, properties:{}}, {start: {_id:771}, end: {_id:732}, properties:{}}, {start: {_id:773}, end: {_id:732}, properties:{}}, {start: {_id:813}, end: {_id:820}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:816}, end: {_id:820}, properties:{}}, {start: {_id:825}, end: {_id:820}, properties:{}}, {start: {_id:827}, end: {_id:820}, properties:{}}, {start: {_id:828}, end: {_id:820}, properties:{}}, {start: {_id:831}, end: {_id:820}, properties:{}}, {start: {_id:834}, end: {_id:820}, properties:{}}, {start: {_id:992}, end: {_id:1025}, properties:{}}, {start: {_id:995}, end: {_id:279}, properties:{}}, {start: {_id:995}, end: {_id:1025}, properties:{}}, {start: {_id:997}, end: {_id:171}, properties:{}}, {start: {_id:998}, end: {_id:279}, properties:{}}, {start: {_id:999}, end: {_id:1025}, properties:{}}, {start: {_id:1000}, end: {_id:1025}, properties:{}}, {start: {_id:1001}, end: {_id:279}, properties:{}}, {start: {_id:1001}, end: {_id:1025}, properties:{}}, {start: {_id:1002}, end: {_id:1025}, properties:{}}, {start: {_id:1003}, end: {_id:1025}, properties:{}}, {start: {_id:1004}, end: {_id:1025}, properties:{}}, {start: {_id:1006}, end: {_id:1005}, properties:{}}, {start: {_id:1007}, end: {_id:1005}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1008}, end: {_id:1025}, properties:{}}, {start: {_id:1009}, end: {_id:279}, properties:{}}, {start: {_id:1012}, end: {_id:1025}, properties:{}}, {start: {_id:1013}, end: {_id:1025}, properties:{}}, {start: {_id:1014}, end: {_id:279}, properties:{}}, {start: {_id:1015}, end: {_id:279}, properties:{}}, {start: {_id:1016}, end: {_id:1025}, properties:{}}, {start: {_id:1017}, end: {_id:1005}, properties:{}}, {start: {_id:1018}, end: {_id:1025}, properties:{}}, {start: {_id:1020}, end: {_id:279}, properties:{}}, {start: {_id:1020}, end: {_id:1025}, properties:{}}, {start: {_id:1021}, end: {_id:279}, properties:{}}, {start: {_id:1022}, end: {_id:171}, properties:{}}, {start: {_id:1023}, end: {_id:1005}, properties:{}}, {start: {_id:1024}, end: {_id:279}, properties:{}}, {start: {_id:1026}, end: {_id:1005}, properties:{}}, {start: {_id:1027}, end: {_id:279}, properties:{}}, {start: {_id:1027}, end: {_id:1025}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:793}, properties:{}}, {start: {_id:784}, end: {_id:793}, properties:{}}, {start: {_id:802}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPERVISION]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:734}, properties:{}}, {start: {_id:766}, end: {_id:754}, properties:{}}, {start: {_id:766}, end: {_id:757}, properties:{}}, {start: {_id:766}, end: {_id:774}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:942}, end: {_id:961}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ALTERNATIVE_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:280}, end: {_id:287}, properties:{}}, {start: {_id:282}, end: {_id:287}, properties:{}}, {start: {_id:285}, end: {_id:287}, properties:{}}, {start: {_id:286}, end: {_id:287}, properties:{}}, {start: {_id:288}, end: {_id:287}, properties:{}}, {start: {_id:292}, end: {_id:287}, properties:{}}, {start: {_id:294}, end: {_id:287}, properties:{}}, {start: {_id:295}, end: {_id:287}, properties:{}}, {start: {_id:297}, end: {_id:287}, properties:{}}, {start: {_id:298}, end: {_id:287}, properties:{}}, {start: {_id:302}, end: {_id:287}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVESTIGATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:277}, end: {_id:264}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MODIFIED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:913}, end: {_id:908}, properties:{}}, {start: {_id:917}, end: {_id:906}, properties:{}}, {start: {_id:919}, end: {_id:916}, properties:{}}, {start: {_id:920}, end: {_id:921}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RESEARCH_INTEREST]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:39}, properties:{}}, {start: {_id:51}, end: {_id:68}, properties:{}}, {start: {_id:57}, end: {_id:51}, properties:{}}, {start: {_id:148}, end: {_id:148}, properties:{}}, {start: {_id:164}, end: {_id:164}, properties:{}}, {start: {_id:190}, end: {_id:190}, properties:{}}, {start: {_id:193}, end: {_id:193}, properties:{}}, {start: {_id:211}, end: {_id:211}, properties:{}}, {start: {_id:229}, end: {_id:229}, properties:{}}, {start: {_id:562}, end: {_id:562}, properties:{}}, {start: {_id:600}, end: {_id:600}, properties:{}}, {start: {_id:1097}, end: {_id:1097}, properties:{}}, {start: {_id:1141}, end: {_id:1141}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:940}, end: {_id:966}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PERFORMED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:925}, end: {_id:954}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PURCHASED_FROM]->(end) SET r += row.properties;
UNWIND [{start: {_id:670}, end: {_id:722}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:687}, end: {_id:678}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ATTRIBUTE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:79}, end: {_id:79}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REVIEWER]->(end) SET r += row.properties;
UNWIND [{start: {_id:486}, end: {_id:485}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:264}, end: {_id:277}, properties:{}}, {start: {_id:766}, end: {_id:720}, properties:{}}, {start: {_id:766}, end: {_id:733}, properties:{}}, {start: {_id:766}, end: {_id:748}, properties:{}}, {start: {_id:766}, end: {_id:768}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:31}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPERVISED]->(end) SET r += row.properties;
UNWIND [{start: {_id:972}, end: {_id:945}, properties:{}}, {start: {_id:972}, end: {_id:976}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:960}, end: {_id:953}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REACTS_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:643}, end: {_id:629}, properties:{}}, {start: {_id:651}, end: {_id:629}, properties:{}}, {start: {_id:652}, end: {_id:629}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:30}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HELPED]->(end) SET r += row.properties;
UNWIND [{start: {_id:242}, end: {_id:259}, properties:{}}, {start: {_id:242}, end: {_id:261}, properties:{}}, {start: {_id:246}, end: {_id:259}, properties:{}}, {start: {_id:246}, end: {_id:261}, properties:{}}, {start: {_id:251}, end: {_id:259}, properties:{}}, {start: {_id:251}, end: {_id:261}, properties:{}}, {start: {_id:253}, end: {_id:259}, properties:{}}, {start: {_id:253}, end: {_id:261}, properties:{}}, {start: {_id:254}, end: {_id:259}, properties:{}}, {start: {_id:254}, end: {_id:261}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:327}, end: {_id:304}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EMAIL]->(end) SET r += row.properties;
UNWIND [{start: {_id:354}, end: {_id:354}, properties:{}}, {start: {_id:402}, end: {_id:402}, properties:{}}, {start: {_id:438}, end: {_id:438}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DATE]->(end) SET r += row.properties;
UNWIND [{start: {_id:785}, end: {_id:781}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DRAWING]->(end) SET r += row.properties;
UNWIND [{start: {_id:939}, end: {_id:933}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ADDED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:843}, end: {_id:845}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:991}, end: {_id:962}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:UNDERGOES]->(end) SET r += row.properties;
UNWIND [{start: {_id:43}, end: {_id:44}, properties:{}}, {start: {_id:43}, end: {_id:45}, properties:{}}, {start: {_id:43}, end: {_id:49}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATED_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:264}, end: {_id:275}, properties:{}}, {start: {_id:277}, end: {_id:269}, properties:{}}, {start: {_id:277}, end: {_id:272}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRODUCED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:689}, end: {_id:724}, properties:{}}, {start: {_id:706}, end: {_id:724}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:777}, end: {_id:793}, properties:{}}, {start: {_id:780}, end: {_id:793}, properties:{}}, {start: {_id:795}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:IDEA_GENERATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:957}, end: {_id:990}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASSEMBLED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:695}, end: {_id:662}, properties:{}}, {start: {_id:705}, end: {_id:662}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPONENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:528}, end: {_id:518}, properties:{}}, {start: {_id:528}, end: {_id:519}, properties:{}}, {start: {_id:528}, end: {_id:520}, properties:{}}, {start: {_id:528}, end: {_id:521}, properties:{}}, {start: {_id:528}, end: {_id:522}, properties:{}}, {start: {_id:528}, end: {_id:523}, properties:{}}, {start: {_id:528}, end: {_id:524}, properties:{}}, {start: {_id:528}, end: {_id:525}, properties:{}}, {start: {_id:528}, end: {_id:526}, properties:{}}, {start: {_id:528}, end: {_id:527}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:78}, properties:{}}, {start: {_id:80}, end: {_id:80}, properties:{}}, {start: {_id:82}, end: {_id:82}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WRITER]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUBSTANCE_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:294}, end: {_id:287}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPERVISION]->(end) SET r += row.properties;
UNWIND [{start: {_id:312}, end: {_id:306}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROJECT]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:745}, properties:{}}, {start: {_id:766}, end: {_id:772}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:843}, end: {_id:842}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:54}, end: {_id:56}, properties:{}}, {start: {_id:62}, end: {_id:74}, properties:{}}, {start: {_id:66}, end: {_id:53}, properties:{}}, {start: {_id:67}, end: {_id:74}, properties:{}}, {start: {_id:72}, end: {_id:74}, properties:{}}, {start: {_id:766}, end: {_id:740}, properties:{}}, {start: {_id:766}, end: {_id:750}, properties:{}}, {start: {_id:766}, end: {_id:761}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:937}, end: {_id:946}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MIXED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:956}, end: {_id:969}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EVALUATED_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:79}, end: {_id:79}, properties:{}}, {start: {_id:80}, end: {_id:80}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROPOSED_RESEARCH]->(end) SET r += row.properties;
UNWIND [{start: {_id:827}, end: {_id:829}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CORRESPONDENCE]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:783}, properties:{}}, {start: {_id:784}, end: {_id:783}, properties:{}}, {start: {_id:802}, end: {_id:797}, properties:{}}, {start: {_id:805}, end: {_id:783}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CORRESPONDING_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:775}, end: {_id:805}, properties:{}}, {start: {_id:788}, end: {_id:776}, properties:{}}, {start: {_id:788}, end: {_id:777}, properties:{}}, {start: {_id:788}, end: {_id:778}, properties:{}}, {start: {_id:788}, end: {_id:780}, properties:{}}, {start: {_id:788}, end: {_id:784}, properties:{}}, {start: {_id:788}, end: {_id:785}, properties:{}}, {start: {_id:788}, end: {_id:786}, properties:{}}, {start: {_id:788}, end: {_id:792}, properties:{}}, {start: {_id:788}, end: {_id:795}, properties:{}}, {start: {_id:788}, end: {_id:802}, properties:{}}, {start: {_id:788}, end: {_id:804}, properties:{}}, {start: {_id:788}, end: {_id:806}, properties:{}}, {start: {_id:797}, end: {_id:776}, properties:{}}, {start: {_id:797}, end: {_id:784}, properties:{}}, {start: {_id:797}, end: {_id:802}, properties:{}}, {start: {_id:799}, end: {_id:802}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:964}, end: {_id:941}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROCURED_FROM]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:32}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPERVISED]->(end) SET r += row.properties;
UNWIND [{start: {_id:977}, end: {_id:974}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EVALUATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:86}, properties:{}}, {start: {_id:15}, end: {_id:86}, properties:{}}, {start: {_id:18}, end: {_id:86}, properties:{}}, {start: {_id:87}, end: {_id:86}, properties:{}}, {start: {_id:89}, end: {_id:86}, properties:{}}, {start: {_id:91}, end: {_id:86}, properties:{}}, {start: {_id:93}, end: {_id:86}, properties:{}}, {start: {_id:94}, end: {_id:86}, properties:{}}, {start: {_id:96}, end: {_id:86}, properties:{}}, {start: {_id:99}, end: {_id:86}, properties:{}}, {start: {_id:277}, end: {_id:265}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:979}, end: {_id:951}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ANALYZED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PART_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:35}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:735}, properties:{}}, {start: {_id:766}, end: {_id:736}, properties:{}}, {start: {_id:766}, end: {_id:739}, properties:{}}, {start: {_id:766}, end: {_id:760}, properties:{}}, {start: {_id:766}, end: {_id:765}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_CHARACTERISTIC]->(end) SET r += row.properties;
UNWIND [{start: {_id:950}, end: {_id:985}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PREPARED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:353}, end: {_id:353}, properties:{}}, {start: {_id:473}, end: {_id:473}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:12}, end: {_id:28}, properties:{}}, {start: {_id:13}, end: {_id:28}, properties:{}}, {start: {_id:17}, end: {_id:28}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:30}, properties:{}}, {start: {_id:784}, end: {_id:30}, properties:{}}, {start: {_id:802}, end: {_id:30}, properties:{}}, {start: {_id:805}, end: {_id:30}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WROTE_AND_REVISED]->(end) SET r += row.properties;
UNWIND [{start: {_id:75}, end: {_id:51}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHORED]->(end) SET r += row.properties;
UNWIND [{start: {_id:767}, end: {_id:766}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPOSED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:52}, end: {_id:50}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEEDS_STUDY]->(end) SET r += row.properties;
UNWIND [{start: {_id:314}, end: {_id:309}, properties:{}}, {start: {_id:324}, end: {_id:310}, properties:{}}, {start: {_id:324}, end: {_id:326}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:294}, end: {_id:301}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING_ACQUISITION]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:78}, properties:{}}, {start: {_id:82}, end: {_id:82}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTRIBUTOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:636}, end: {_id:624}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:943}, end: {_id:936}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DISSOLVED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:830}, end: {_id:820}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING]->(end) SET r += row.properties;
UNWIND [{start: {_id:62}, end: {_id:60}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STUDY]->(end) SET r += row.properties;
UNWIND [{start: {_id:264}, end: {_id:269}, properties:{}}, {start: {_id:264}, end: {_id:272}, properties:{}}, {start: {_id:277}, end: {_id:269}, properties:{}}, {start: {_id:277}, end: {_id:272}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:APPLIED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:242}, end: {_id:244}, properties:{}}, {start: {_id:242}, end: {_id:250}, properties:{}}, {start: {_id:246}, end: {_id:244}, properties:{}}, {start: {_id:246}, end: {_id:250}, properties:{}}, {start: {_id:251}, end: {_id:244}, properties:{}}, {start: {_id:251}, end: {_id:250}, properties:{}}, {start: {_id:253}, end: {_id:244}, properties:{}}, {start: {_id:253}, end: {_id:250}, properties:{}}, {start: {_id:254}, end: {_id:244}, properties:{}}, {start: {_id:254}, end: {_id:250}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:660}, end: {_id:728}, properties:{}}, {start: {_id:673}, end: {_id:728}, properties:{}}, {start: {_id:697}, end: {_id:728}, properties:{}}, {start: {_id:715}, end: {_id:728}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PART_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:48}, end: {_id:44}, properties:{}}, {start: {_id:48}, end: {_id:45}, properties:{}}, {start: {_id:48}, end: {_id:46}, properties:{}}, {start: {_id:48}, end: {_id:49}, properties:{}}, {start: {_id:86}, end: {_id:84}, properties:{}}, {start: {_id:86}, end: {_id:85}, properties:{}}, {start: {_id:86}, end: {_id:92}, properties:{}}, {start: {_id:86}, end: {_id:97}, properties:{}}, {start: {_id:86}, end: {_id:98}, properties:{}}, {start: {_id:686}, end: {_id:672}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:305}, end: {_id:321}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TITLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:509}, end: {_id:491}, properties:{}}, {start: {_id:511}, end: {_id:491}, properties:{}}, {start: {_id:512}, end: {_id:491}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:929}, end: {_id:935}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ADDED_AND_SUBJECTED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:55}, end: {_id:71}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DESCRIBES]->(end) SET r += row.properties;
UNWIND [{start: {_id:304}, end: {_id:319}, properties:{}}, {start: {_id:308}, end: {_id:319}, properties:{}}, {start: {_id:313}, end: {_id:319}, properties:{}}, {start: {_id:322}, end: {_id:319}, properties:{}}, {start: {_id:328}, end: {_id:319}, properties:{}}, {start: {_id:329}, end: {_id:319}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:988}, end: {_id:982}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUITS]->(end) SET r += row.properties;
UNWIND [{start: {_id:978}, end: {_id:970}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONDUCTED_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:58}, end: {_id:75}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WORKS_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:303}, end: {_id:311}, properties:{}}, {start: {_id:307}, end: {_id:318}, properties:{}}, {start: {_id:315}, end: {_id:316}, properties:{}}, {start: {_id:323}, end: {_id:317}, properties:{}}, {start: {_id:325}, end: {_id:320}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:588}, end: {_id:575}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDER]->(end) SET r += row.properties;
UNWIND [{start: {_id:938}, end: {_id:967}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PREPARED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:321}, end: {_id:319}, properties:{}}, {start: {_id:732}, end: {_id:36}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:289}, properties:{}}, {start: {_id:4}, end: {_id:290}, properties:{}}, {start: {_id:4}, end: {_id:293}, properties:{}}, {start: {_id:4}, end: {_id:299}, properties:{}}, {start: {_id:283}, end: {_id:284}, properties:{}}, {start: {_id:283}, end: {_id:289}, properties:{}}, {start: {_id:283}, end: {_id:291}, properties:{}}, {start: {_id:287}, end: {_id:284}, properties:{}}, {start: {_id:287}, end: {_id:289}, properties:{}}, {start: {_id:287}, end: {_id:291}, properties:{}}, {start: {_id:287}, end: {_id:296}, properties:{}}, {start: {_id:287}, end: {_id:299}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_PROPERTY]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:349}, properties:{}}, {start: {_id:78}, end: {_id:78}, properties:{}}, {start: {_id:79}, end: {_id:79}, properties:{}}, {start: {_id:80}, end: {_id:80}, properties:{}}, {start: {_id:81}, end: {_id:81}, properties:{}}, {start: {_id:82}, end: {_id:82}, properties:{}}, {start: {_id:84}, end: {_id:85}, properties:{}}, {start: {_id:84}, end: {_id:92}, properties:{}}, {start: {_id:84}, end: {_id:97}, properties:{}}, {start: {_id:84}, end: {_id:98}, properties:{}}, {start: {_id:85}, end: {_id:84}, properties:{}}, {start: {_id:85}, end: {_id:92}, properties:{}}, {start: {_id:85}, end: {_id:97}, properties:{}}, {start: {_id:85}, end: {_id:98}, properties:{}}, {start: {_id:88}, end: {_id:84}, properties:{}}, {start: {_id:88}, end: {_id:85}, properties:{}}, {start: {_id:88}, end: {_id:92}, properties:{}}, {start: {_id:88}, end: {_id:97}, properties:{}}, {start: {_id:88}, end: {_id:98}, properties:{}}, {start: {_id:92}, end: {_id:84}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:92}, end: {_id:85}, properties:{}}, {start: {_id:92}, end: {_id:97}, properties:{}}, {start: {_id:92}, end: {_id:98}, properties:{}}, {start: {_id:92}, end: {_id:92}, properties:{}}, {start: {_id:97}, end: {_id:84}, properties:{}}, {start: {_id:97}, end: {_id:85}, properties:{}}, {start: {_id:97}, end: {_id:92}, properties:{}}, {start: {_id:97}, end: {_id:98}, properties:{}}, {start: {_id:98}, end: {_id:84}, properties:{}}, {start: {_id:98}, end: {_id:85}, properties:{}}, {start: {_id:98}, end: {_id:92}, properties:{}}, {start: {_id:98}, end: {_id:97}, properties:{}}, {start: {_id:332}, end: {_id:332}, properties:{}}, {start: {_id:393}, end: {_id:355}, properties:{}}, {start: {_id:396}, end: {_id:396}, properties:{}}, {start: {_id:428}, end: {_id:408}, properties:{}}, {start: {_id:434}, end: {_id:434}, properties:{}}, {start: {_id:444}, end: {_id:444}, properties:{}}, {start: {_id:464}, end: {_id:812}, properties:{}}, {start: {_id:477}, end: {_id:477}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:499}, end: {_id:499}, properties:{}}, {start: {_id:530}, end: {_id:530}, properties:{}}, {start: {_id:533}, end: {_id:533}, properties:{}}, {start: {_id:542}, end: {_id:542}, properties:{}}, {start: {_id:559}, end: {_id:559}, properties:{}}, {start: {_id:561}, end: {_id:561}, properties:{}}, {start: {_id:572}, end: {_id:572}, properties:{}}, {start: {_id:580}, end: {_id:580}, properties:{}}, {start: {_id:586}, end: {_id:586}, properties:{}}, {start: {_id:604}, end: {_id:604}, properties:{}}, {start: {_id:607}, end: {_id:607}, properties:{}}, {start: {_id:808}, end: {_id:812}, properties:{}}, {start: {_id:809}, end: {_id:812}, properties:{}}, {start: {_id:810}, end: {_id:464}, properties:{}}, {start: {_id:810}, end: {_id:808}, properties:{}}, {start: {_id:810}, end: {_id:809}, properties:{}}, {start: {_id:810}, end: {_id:811}, properties:{}}, {start: {_id:810}, end: {_id:812}, properties:{}}, {start: {_id:810}, end: {_id:810}, properties:{}}, {start: {_id:811}, end: {_id:812}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:812}, end: {_id:812}, properties:{}}, {start: {_id:1028}, end: {_id:1028}, properties:{}}, {start: {_id:1029}, end: {_id:1029}, properties:{}}, {start: {_id:1030}, end: {_id:1030}, properties:{}}, {start: {_id:1031}, end: {_id:1031}, properties:{}}, {start: {_id:1032}, end: {_id:1032}, properties:{}}, {start: {_id:1033}, end: {_id:1033}, properties:{}}, {start: {_id:1034}, end: {_id:1034}, properties:{}}, {start: {_id:1035}, end: {_id:1035}, properties:{}}, {start: {_id:1036}, end: {_id:1036}, properties:{}}, {start: {_id:1037}, end: {_id:1037}, properties:{}}, {start: {_id:1038}, end: {_id:1038}, properties:{}}, {start: {_id:1039}, end: {_id:1039}, properties:{}}, {start: {_id:1040}, end: {_id:1040}, properties:{}}, {start: {_id:1041}, end: {_id:1041}, properties:{}}, {start: {_id:1042}, end: {_id:1042}, properties:{}}, {start: {_id:1043}, end: {_id:1043}, properties:{}}, {start: {_id:1044}, end: {_id:1044}, properties:{}}, {start: {_id:1045}, end: {_id:1045}, properties:{}}, {start: {_id:1046}, end: {_id:1046}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1047}, end: {_id:1047}, properties:{}}, {start: {_id:1048}, end: {_id:1048}, properties:{}}, {start: {_id:1049}, end: {_id:1049}, properties:{}}, {start: {_id:1050}, end: {_id:1050}, properties:{}}, {start: {_id:1051}, end: {_id:1051}, properties:{}}, {start: {_id:1052}, end: {_id:1052}, properties:{}}, {start: {_id:1053}, end: {_id:1053}, properties:{}}, {start: {_id:1054}, end: {_id:1054}, properties:{}}, {start: {_id:1055}, end: {_id:1055}, properties:{}}, {start: {_id:1056}, end: {_id:1056}, properties:{}}, {start: {_id:1057}, end: {_id:1057}, properties:{}}, {start: {_id:1058}, end: {_id:1058}, properties:{}}, {start: {_id:1059}, end: {_id:1059}, properties:{}}, {start: {_id:1060}, end: {_id:1060}, properties:{}}, {start: {_id:1061}, end: {_id:1061}, properties:{}}, {start: {_id:1062}, end: {_id:1062}, properties:{}}, {start: {_id:1063}, end: {_id:1063}, properties:{}}, {start: {_id:1064}, end: {_id:1064}, properties:{}}, {start: {_id:1065}, end: {_id:1065}, properties:{}}, {start: {_id:1066}, end: {_id:1066}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1067}, end: {_id:1067}, properties:{}}, {start: {_id:1068}, end: {_id:1068}, properties:{}}, {start: {_id:1069}, end: {_id:1069}, properties:{}}, {start: {_id:1070}, end: {_id:1070}, properties:{}}, {start: {_id:1071}, end: {_id:1071}, properties:{}}, {start: {_id:1072}, end: {_id:1072}, properties:{}}, {start: {_id:1073}, end: {_id:1073}, properties:{}}, {start: {_id:1074}, end: {_id:1074}, properties:{}}, {start: {_id:1075}, end: {_id:1075}, properties:{}}, {start: {_id:1076}, end: {_id:1076}, properties:{}}, {start: {_id:1077}, end: {_id:1077}, properties:{}}, {start: {_id:1078}, end: {_id:1078}, properties:{}}, {start: {_id:1079}, end: {_id:1079}, properties:{}}, {start: {_id:1080}, end: {_id:1080}, properties:{}}, {start: {_id:1081}, end: {_id:1081}, properties:{}}, {start: {_id:1082}, end: {_id:1082}, properties:{}}, {start: {_id:1083}, end: {_id:1083}, properties:{}}, {start: {_id:1084}, end: {_id:1084}, properties:{}}, {start: {_id:1085}, end: {_id:1085}, properties:{}}, {start: {_id:1086}, end: {_id:1086}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1087}, end: {_id:1087}, properties:{}}, {start: {_id:1088}, end: {_id:1088}, properties:{}}, {start: {_id:1089}, end: {_id:1089}, properties:{}}, {start: {_id:1090}, end: {_id:1090}, properties:{}}, {start: {_id:1091}, end: {_id:1091}, properties:{}}, {start: {_id:1092}, end: {_id:1092}, properties:{}}, {start: {_id:1093}, end: {_id:1093}, properties:{}}, {start: {_id:1094}, end: {_id:1094}, properties:{}}, {start: {_id:1095}, end: {_id:1095}, properties:{}}, {start: {_id:1096}, end: {_id:1096}, properties:{}}, {start: {_id:1098}, end: {_id:1098}, properties:{}}, {start: {_id:1099}, end: {_id:1099}, properties:{}}, {start: {_id:1100}, end: {_id:1100}, properties:{}}, {start: {_id:1101}, end: {_id:1101}, properties:{}}, {start: {_id:1102}, end: {_id:1102}, properties:{}}, {start: {_id:1103}, end: {_id:1103}, properties:{}}, {start: {_id:1104}, end: {_id:1104}, properties:{}}, {start: {_id:1105}, end: {_id:1105}, properties:{}}, {start: {_id:1106}, end: {_id:1106}, properties:{}}, {start: {_id:1107}, end: {_id:1107}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1108}, end: {_id:1108}, properties:{}}, {start: {_id:1109}, end: {_id:1109}, properties:{}}, {start: {_id:1110}, end: {_id:1110}, properties:{}}, {start: {_id:1111}, end: {_id:1111}, properties:{}}, {start: {_id:1112}, end: {_id:1112}, properties:{}}, {start: {_id:1113}, end: {_id:1113}, properties:{}}, {start: {_id:1114}, end: {_id:1114}, properties:{}}, {start: {_id:1115}, end: {_id:1115}, properties:{}}, {start: {_id:1116}, end: {_id:1116}, properties:{}}, {start: {_id:1117}, end: {_id:1117}, properties:{}}, {start: {_id:1118}, end: {_id:1118}, properties:{}}, {start: {_id:1119}, end: {_id:1119}, properties:{}}, {start: {_id:1120}, end: {_id:1120}, properties:{}}, {start: {_id:1121}, end: {_id:1121}, properties:{}}, {start: {_id:1122}, end: {_id:1122}, properties:{}}, {start: {_id:1123}, end: {_id:1123}, properties:{}}, {start: {_id:1124}, end: {_id:1124}, properties:{}}, {start: {_id:1125}, end: {_id:1125}, properties:{}}, {start: {_id:1126}, end: {_id:1126}, properties:{}}, {start: {_id:1127}, end: {_id:1127}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:1128}, end: {_id:1128}, properties:{}}, {start: {_id:1129}, end: {_id:1129}, properties:{}}, {start: {_id:1130}, end: {_id:1130}, properties:{}}, {start: {_id:1131}, end: {_id:1131}, properties:{}}, {start: {_id:1132}, end: {_id:1132}, properties:{}}, {start: {_id:1133}, end: {_id:1133}, properties:{}}, {start: {_id:1134}, end: {_id:1134}, properties:{}}, {start: {_id:1135}, end: {_id:1135}, properties:{}}, {start: {_id:1136}, end: {_id:1136}, properties:{}}, {start: {_id:1137}, end: {_id:1137}, properties:{}}, {start: {_id:1138}, end: {_id:1138}, properties:{}}, {start: {_id:1139}, end: {_id:1139}, properties:{}}, {start: {_id:1140}, end: {_id:1140}, properties:{}}, {start: {_id:1142}, end: {_id:1142}, properties:{}}, {start: {_id:1143}, end: {_id:1143}, properties:{}}, {start: {_id:1144}, end: {_id:1144}, properties:{}}, {start: {_id:1145}, end: {_id:1145}, properties:{}}, {start: {_id:1146}, end: {_id:1146}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:159}, properties:{}}, {start: {_id:117}, end: {_id:163}, properties:{}}, {start: {_id:117}, end: {_id:219}, properties:{}}, {start: {_id:117}, end: {_id:232}, properties:{}}, {start: {_id:135}, end: {_id:159}, properties:{}}, {start: {_id:135}, end: {_id:163}, properties:{}}, {start: {_id:135}, end: {_id:219}, properties:{}}, {start: {_id:135}, end: {_id:232}, properties:{}}, {start: {_id:139}, end: {_id:159}, properties:{}}, {start: {_id:139}, end: {_id:163}, properties:{}}, {start: {_id:139}, end: {_id:219}, properties:{}}, {start: {_id:139}, end: {_id:232}, properties:{}}, {start: {_id:140}, end: {_id:159}, properties:{}}, {start: {_id:140}, end: {_id:163}, properties:{}}, {start: {_id:140}, end: {_id:219}, properties:{}}, {start: {_id:140}, end: {_id:232}, properties:{}}, {start: {_id:155}, end: {_id:159}, properties:{}}, {start: {_id:155}, end: {_id:163}, properties:{}}, {start: {_id:155}, end: {_id:219}, properties:{}}, {start: {_id:155}, end: {_id:232}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:169}, end: {_id:159}, properties:{}}, {start: {_id:169}, end: {_id:163}, properties:{}}, {start: {_id:169}, end: {_id:219}, properties:{}}, {start: {_id:169}, end: {_id:232}, properties:{}}, {start: {_id:189}, end: {_id:159}, properties:{}}, {start: {_id:189}, end: {_id:163}, properties:{}}, {start: {_id:189}, end: {_id:219}, properties:{}}, {start: {_id:189}, end: {_id:232}, properties:{}}, {start: {_id:195}, end: {_id:159}, properties:{}}, {start: {_id:195}, end: {_id:163}, properties:{}}, {start: {_id:195}, end: {_id:219}, properties:{}}, {start: {_id:195}, end: {_id:232}, properties:{}}, {start: {_id:196}, end: {_id:159}, properties:{}}, {start: {_id:196}, end: {_id:163}, properties:{}}, {start: {_id:196}, end: {_id:219}, properties:{}}, {start: {_id:196}, end: {_id:232}, properties:{}}, {start: {_id:199}, end: {_id:159}, properties:{}}, {start: {_id:199}, end: {_id:163}, properties:{}}, {start: {_id:199}, end: {_id:219}, properties:{}}, {start: {_id:199}, end: {_id:232}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:213}, end: {_id:159}, properties:{}}, {start: {_id:213}, end: {_id:163}, properties:{}}, {start: {_id:213}, end: {_id:219}, properties:{}}, {start: {_id:213}, end: {_id:232}, properties:{}}, {start: {_id:234}, end: {_id:159}, properties:{}}, {start: {_id:234}, end: {_id:163}, properties:{}}, {start: {_id:234}, end: {_id:219}, properties:{}}, {start: {_id:234}, end: {_id:232}, properties:{}}, {start: {_id:239}, end: {_id:159}, properties:{}}, {start: {_id:239}, end: {_id:163}, properties:{}}, {start: {_id:239}, end: {_id:219}, properties:{}}, {start: {_id:239}, end: {_id:232}, properties:{}}, {start: {_id:242}, end: {_id:243}, properties:{}}, {start: {_id:242}, end: {_id:247}, properties:{}}, {start: {_id:242}, end: {_id:248}, properties:{}}, {start: {_id:242}, end: {_id:249}, properties:{}}, {start: {_id:242}, end: {_id:252}, properties:{}}, {start: {_id:242}, end: {_id:255}, properties:{}}, {start: {_id:242}, end: {_id:257}, properties:{}}, {start: {_id:242}, end: {_id:260}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:246}, end: {_id:243}, properties:{}}, {start: {_id:246}, end: {_id:247}, properties:{}}, {start: {_id:246}, end: {_id:248}, properties:{}}, {start: {_id:246}, end: {_id:249}, properties:{}}, {start: {_id:246}, end: {_id:252}, properties:{}}, {start: {_id:246}, end: {_id:255}, properties:{}}, {start: {_id:246}, end: {_id:257}, properties:{}}, {start: {_id:246}, end: {_id:260}, properties:{}}, {start: {_id:251}, end: {_id:243}, properties:{}}, {start: {_id:251}, end: {_id:247}, properties:{}}, {start: {_id:251}, end: {_id:248}, properties:{}}, {start: {_id:251}, end: {_id:249}, properties:{}}, {start: {_id:251}, end: {_id:252}, properties:{}}, {start: {_id:251}, end: {_id:255}, properties:{}}, {start: {_id:251}, end: {_id:257}, properties:{}}, {start: {_id:251}, end: {_id:260}, properties:{}}, {start: {_id:253}, end: {_id:243}, properties:{}}, {start: {_id:253}, end: {_id:247}, properties:{}}, {start: {_id:253}, end: {_id:248}, properties:{}}, {start: {_id:253}, end: {_id:249}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:253}, end: {_id:252}, properties:{}}, {start: {_id:253}, end: {_id:255}, properties:{}}, {start: {_id:253}, end: {_id:257}, properties:{}}, {start: {_id:253}, end: {_id:260}, properties:{}}, {start: {_id:254}, end: {_id:243}, properties:{}}, {start: {_id:254}, end: {_id:247}, properties:{}}, {start: {_id:254}, end: {_id:248}, properties:{}}, {start: {_id:254}, end: {_id:249}, properties:{}}, {start: {_id:254}, end: {_id:252}, properties:{}}, {start: {_id:254}, end: {_id:255}, properties:{}}, {start: {_id:254}, end: {_id:257}, properties:{}}, {start: {_id:254}, end: {_id:260}, properties:{}}, {start: {_id:262}, end: {_id:269}, properties:{}}, {start: {_id:263}, end: {_id:269}, properties:{}}, {start: {_id:266}, end: {_id:269}, properties:{}}, {start: {_id:267}, end: {_id:269}, properties:{}}, {start: {_id:270}, end: {_id:272}, properties:{}}, {start: {_id:271}, end: {_id:269}, properties:{}}, {start: {_id:273}, end: {_id:272}, properties:{}}, {start: {_id:274}, end: {_id:269}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:280}, end: {_id:863}, properties:{}}, {start: {_id:292}, end: {_id:863}, properties:{}}, {start: {_id:298}, end: {_id:863}, properties:{}}, {start: {_id:857}, end: {_id:852}, properties:{}}, {start: {_id:858}, end: {_id:863}, properties:{}}, {start: {_id:862}, end: {_id:863}, properties:{}}, {start: {_id:862}, end: {_id:884}, properties:{}}, {start: {_id:862}, end: {_id:899}, properties:{}}, {start: {_id:873}, end: {_id:871}, properties:{}}, {start: {_id:873}, end: {_id:884}, properties:{}}, {start: {_id:877}, end: {_id:871}, properties:{}}, {start: {_id:877}, end: {_id:884}, properties:{}}, {start: {_id:885}, end: {_id:852}, properties:{}}, {start: {_id:886}, end: {_id:863}, properties:{}}, {start: {_id:886}, end: {_id:884}, properties:{}}, {start: {_id:886}, end: {_id:899}, properties:{}}, {start: {_id:897}, end: {_id:852}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:767}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPOSED_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:437}, end: {_id:431}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EDITOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:947}, end: {_id:965}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:APPLIED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:15}, end: {_id:696}, properties:{}}, {start: {_id:18}, end: {_id:696}, properties:{}}, {start: {_id:712}, end: {_id:696}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPONENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:666}, end: {_id:694}, properties:{}}, {start: {_id:666}, end: {_id:700}, properties:{}}, {start: {_id:696}, end: {_id:685}, properties:{}}, {start: {_id:719}, end: {_id:727}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXAMPLE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:665}, end: {_id:728}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:APPLIED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:44}, end: {_id:47}, properties:{}}, {start: {_id:45}, end: {_id:47}, properties:{}}, {start: {_id:46}, end: {_id:47}, properties:{}}, {start: {_id:49}, end: {_id:47}, properties:{}}, {start: {_id:540}, end: {_id:532}, properties:{}}, {start: {_id:558}, end: {_id:532}, properties:{}}, {start: {_id:593}, end: {_id:532}, properties:{}}, {start: {_id:594}, end: {_id:532}, properties:{}}, {start: {_id:601}, end: {_id:532}, properties:{}}, {start: {_id:603}, end: {_id:532}, properties:{}}, {start: {_id:843}, end: {_id:839}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:710}, end: {_id:662}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RELATED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:960}, end: {_id:959}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFECTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:818}, end: {_id:820}, properties:{}}, {start: {_id:822}, end: {_id:820}, properties:{}}, {start: {_id:823}, end: {_id:820}, properties:{}}, {start: {_id:829}, end: {_id:820}, properties:{}}, {start: {_id:836}, end: {_id:820}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:661}, end: {_id:728}, properties:{}}, {start: {_id:698}, end: {_id:728}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PERFORMED_ON]->(end) SET r += row.properties;
UNWIND [{start: {_id:806}, end: {_id:787}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PERFORMED]->(end) SET r += row.properties;
UNWIND [{start: {_id:82}, end: {_id:82}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONDUCTED_EXPERIMENTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:81}, end: {_id:81}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DESIGNED_SCHEMATIC]->(end) SET r += row.properties;
UNWIND [{start: {_id:699}, end: {_id:676}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LOCATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:0}, end: {_id:387}, properties:{}}, {start: {_id:3}, end: {_id:395}, properties:{}}, {start: {_id:330}, end: {_id:372}, properties:{}}, {start: {_id:331}, end: {_id:391}, properties:{}}, {start: {_id:332}, end: {_id:369}, properties:{}}, {start: {_id:333}, end: {_id:348}, properties:{}}, {start: {_id:334}, end: {_id:350}, properties:{}}, {start: {_id:337}, end: {_id:419}, properties:{}}, {start: {_id:338}, end: {_id:469}, properties:{}}, {start: {_id:341}, end: {_id:356}, properties:{}}, {start: {_id:342}, end: {_id:425}, properties:{}}, {start: {_id:343}, end: {_id:385}, properties:{}}, {start: {_id:345}, end: {_id:389}, properties:{}}, {start: {_id:346}, end: {_id:405}, properties:{}}, {start: {_id:347}, end: {_id:452}, properties:{}}, {start: {_id:351}, end: {_id:339}, properties:{}}, {start: {_id:352}, end: {_id:388}, properties:{}}, {start: {_id:359}, end: {_id:416}, properties:{}}, {start: {_id:365}, end: {_id:466}, properties:{}}, {start: {_id:366}, end: {_id:445}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:371}, end: {_id:479}, properties:{}}, {start: {_id:373}, end: {_id:344}, properties:{}}, {start: {_id:375}, end: {_id:361}, properties:{}}, {start: {_id:377}, end: {_id:483}, properties:{}}, {start: {_id:380}, end: {_id:383}, properties:{}}, {start: {_id:381}, end: {_id:368}, properties:{}}, {start: {_id:382}, end: {_id:417}, properties:{}}, {start: {_id:384}, end: {_id:336}, properties:{}}, {start: {_id:386}, end: {_id:2}, properties:{}}, {start: {_id:392}, end: {_id:374}, properties:{}}, {start: {_id:394}, end: {_id:472}, properties:{}}, {start: {_id:396}, end: {_id:461}, properties:{}}, {start: {_id:397}, end: {_id:388}, properties:{}}, {start: {_id:399}, end: {_id:461}, properties:{}}, {start: {_id:400}, end: {_id:418}, properties:{}}, {start: {_id:401}, end: {_id:362}, properties:{}}, {start: {_id:403}, end: {_id:370}, properties:{}}, {start: {_id:406}, end: {_id:350}, properties:{}}, {start: {_id:409}, end: {_id:415}, properties:{}}, {start: {_id:410}, end: {_id:420}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:411}, end: {_id:450}, properties:{}}, {start: {_id:412}, end: {_id:480}, properties:{}}, {start: {_id:413}, end: {_id:456}, properties:{}}, {start: {_id:414}, end: {_id:358}, properties:{}}, {start: {_id:422}, end: {_id:439}, properties:{}}, {start: {_id:423}, end: {_id:357}, properties:{}}, {start: {_id:424}, end: {_id:390}, properties:{}}, {start: {_id:426}, end: {_id:367}, properties:{}}, {start: {_id:427}, end: {_id:2}, properties:{}}, {start: {_id:432}, end: {_id:363}, properties:{}}, {start: {_id:433}, end: {_id:360}, properties:{}}, {start: {_id:434}, end: {_id:474}, properties:{}}, {start: {_id:435}, end: {_id:430}, properties:{}}, {start: {_id:436}, end: {_id:471}, properties:{}}, {start: {_id:440}, end: {_id:463}, properties:{}}, {start: {_id:441}, end: {_id:407}, properties:{}}, {start: {_id:443}, end: {_id:478}, properties:{}}, {start: {_id:444}, end: {_id:446}, properties:{}}, {start: {_id:447}, end: {_id:451}, properties:{}}, {start: {_id:448}, end: {_id:442}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:453}, end: {_id:364}, properties:{}}, {start: {_id:454}, end: {_id:404}, properties:{}}, {start: {_id:457}, end: {_id:378}, properties:{}}, {start: {_id:458}, end: {_id:340}, properties:{}}, {start: {_id:459}, end: {_id:455}, properties:{}}, {start: {_id:460}, end: {_id:361}, properties:{}}, {start: {_id:464}, end: {_id:421}, properties:{}}, {start: {_id:465}, end: {_id:376}, properties:{}}, {start: {_id:467}, end: {_id:379}, properties:{}}, {start: {_id:468}, end: {_id:481}, properties:{}}, {start: {_id:475}, end: {_id:462}, properties:{}}, {start: {_id:476}, end: {_id:474}, properties:{}}, {start: {_id:477}, end: {_id:417}, properties:{}}, {start: {_id:482}, end: {_id:398}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:29}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVESTIGATED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:429}, end: {_id:429}, properties:{}}, {start: {_id:470}, end: {_id:470}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EMAIL]->(end) SET r += row.properties;
UNWIND [{start: {_id:972}, end: {_id:975}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PLACED_ON_TOP_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:932}, end: {_id:923}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:84}, properties:{}}, {start: {_id:4}, end: {_id:85}, properties:{}}, {start: {_id:4}, end: {_id:92}, properties:{}}, {start: {_id:4}, end: {_id:97}, properties:{}}, {start: {_id:4}, end: {_id:98}, properties:{}}, {start: {_id:15}, end: {_id:84}, properties:{}}, {start: {_id:15}, end: {_id:85}, properties:{}}, {start: {_id:15}, end: {_id:92}, properties:{}}, {start: {_id:15}, end: {_id:97}, properties:{}}, {start: {_id:15}, end: {_id:98}, properties:{}}, {start: {_id:18}, end: {_id:84}, properties:{}}, {start: {_id:18}, end: {_id:85}, properties:{}}, {start: {_id:18}, end: {_id:92}, properties:{}}, {start: {_id:18}, end: {_id:97}, properties:{}}, {start: {_id:18}, end: {_id:98}, properties:{}}, {start: {_id:87}, end: {_id:84}, properties:{}}, {start: {_id:87}, end: {_id:85}, properties:{}}, {start: {_id:87}, end: {_id:92}, properties:{}}, {start: {_id:87}, end: {_id:97}, properties:{}}, {start: {_id:87}, end: {_id:98}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:89}, end: {_id:84}, properties:{}}, {start: {_id:89}, end: {_id:85}, properties:{}}, {start: {_id:89}, end: {_id:92}, properties:{}}, {start: {_id:89}, end: {_id:97}, properties:{}}, {start: {_id:89}, end: {_id:98}, properties:{}}, {start: {_id:91}, end: {_id:84}, properties:{}}, {start: {_id:91}, end: {_id:85}, properties:{}}, {start: {_id:91}, end: {_id:92}, properties:{}}, {start: {_id:91}, end: {_id:97}, properties:{}}, {start: {_id:91}, end: {_id:98}, properties:{}}, {start: {_id:93}, end: {_id:84}, properties:{}}, {start: {_id:93}, end: {_id:85}, properties:{}}, {start: {_id:93}, end: {_id:92}, properties:{}}, {start: {_id:93}, end: {_id:97}, properties:{}}, {start: {_id:93}, end: {_id:98}, properties:{}}, {start: {_id:94}, end: {_id:84}, properties:{}}, {start: {_id:94}, end: {_id:85}, properties:{}}, {start: {_id:94}, end: {_id:92}, properties:{}}, {start: {_id:94}, end: {_id:97}, properties:{}}, {start: {_id:94}, end: {_id:98}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:96}, end: {_id:84}, properties:{}}, {start: {_id:96}, end: {_id:85}, properties:{}}, {start: {_id:96}, end: {_id:92}, properties:{}}, {start: {_id:96}, end: {_id:97}, properties:{}}, {start: {_id:96}, end: {_id:98}, properties:{}}, {start: {_id:99}, end: {_id:84}, properties:{}}, {start: {_id:99}, end: {_id:85}, properties:{}}, {start: {_id:99}, end: {_id:92}, properties:{}}, {start: {_id:99}, end: {_id:97}, properties:{}}, {start: {_id:99}, end: {_id:98}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:488}, end: {_id:487}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DETERMINED_FROM]->(end) SET r += row.properties;
UNWIND [{start: {_id:988}, end: {_id:926}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROTECTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:659}, end: {_id:709}, properties:{}}, {start: {_id:672}, end: {_id:709}, properties:{}}, {start: {_id:692}, end: {_id:709}, properties:{}}, {start: {_id:714}, end: {_id:709}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:22}, properties:{}}, {start: {_id:12}, end: {_id:22}, properties:{}}, {start: {_id:13}, end: {_id:22}, properties:{}}, {start: {_id:17}, end: {_id:22}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVOLVES]->(end) SET r += row.properties;
UNWIND [{start: {_id:682}, end: {_id:688}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXAMPLE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:806}, end: {_id:787}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FORMAL_ANALYSIS]->(end) SET r += row.properties;
UNWIND [{start: {_id:63}, end: {_id:69}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BASED_ON]->(end) SET r += row.properties;
UNWIND [{start: {_id:335}, end: {_id:335}, properties:{}}, {start: {_id:449}, end: {_id:449}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:LOCATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:73}, end: {_id:75}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WORKS_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:920}, end: {_id:911}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RESEARCH_FELLOW_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:676}, end: {_id:718}, properties:{}}, {start: {_id:829}, end: {_id:833}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ADDRESS]->(end) SET r += row.properties;
UNWIND [{start: {_id:292}, end: {_id:859}, properties:{}}, {start: {_id:298}, end: {_id:864}, properties:{}}, {start: {_id:862}, end: {_id:882}, properties:{}}, {start: {_id:873}, end: {_id:882}, properties:{}}, {start: {_id:877}, end: {_id:875}, properties:{}}, {start: {_id:886}, end: {_id:898}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:931}, end: {_id:944}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROVIDED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:933}, end: {_id:948}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MIXED_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:41}, end: {_id:44}, properties:{}}, {start: {_id:41}, end: {_id:45}, properties:{}}, {start: {_id:41}, end: {_id:46}, properties:{}}, {start: {_id:41}, end: {_id:49}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:922}, end: {_id:973}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ADDED_INTO]->(end) SET r += row.properties;
UNWIND [{start: {_id:971}, end: {_id:952}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HANDLED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:34}, end: {_id:35}, properties:{}}, {start: {_id:34}, end: {_id:37}, properties:{}}, {start: {_id:34}, end: {_id:38}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:66}, end: {_id:65}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXHIBIT]->(end) SET r += row.properties;
UNWIND [{start: {_id:980}, end: {_id:928}, properties:{}}, {start: {_id:987}, end: {_id:984}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USES]->(end) SET r += row.properties;
UNWIND [{start: {_id:118}, end: {_id:874}, properties:{}}, {start: {_id:124}, end: {_id:896}, properties:{}}, {start: {_id:128}, end: {_id:870}, properties:{}}, {start: {_id:128}, end: {_id:883}, properties:{}}, {start: {_id:157}, end: {_id:892}, properties:{}}, {start: {_id:170}, end: {_id:856}, properties:{}}, {start: {_id:170}, end: {_id:878}, properties:{}}, {start: {_id:201}, end: {_id:861}, properties:{}}, {start: {_id:204}, end: {_id:876}, properties:{}}, {start: {_id:235}, end: {_id:894}, properties:{}}, {start: {_id:848}, end: {_id:850}, properties:{}}, {start: {_id:849}, end: {_id:879}, properties:{}}, {start: {_id:854}, end: {_id:868}, properties:{}}, {start: {_id:854}, end: {_id:901}, properties:{}}, {start: {_id:860}, end: {_id:872}, properties:{}}, {start: {_id:865}, end: {_id:853}, properties:{}}, {start: {_id:867}, end: {_id:869}, properties:{}}, {start: {_id:867}, end: {_id:900}, properties:{}}, {start: {_id:880}, end: {_id:866}, properties:{}}, {start: {_id:887}, end: {_id:895}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:888}, end: {_id:847}, properties:{}}, {start: {_id:888}, end: {_id:893}, properties:{}}, {start: {_id:890}, end: {_id:855}, properties:{}}, {start: {_id:891}, end: {_id:851}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:794}, end: {_id:39}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:793}, properties:{}}, {start: {_id:777}, end: {_id:793}, properties:{}}, {start: {_id:778}, end: {_id:793}, properties:{}}, {start: {_id:780}, end: {_id:793}, properties:{}}, {start: {_id:784}, end: {_id:793}, properties:{}}, {start: {_id:785}, end: {_id:793}, properties:{}}, {start: {_id:786}, end: {_id:793}, properties:{}}, {start: {_id:792}, end: {_id:793}, properties:{}}, {start: {_id:795}, end: {_id:793}, properties:{}}, {start: {_id:802}, end: {_id:793}, properties:{}}, {start: {_id:804}, end: {_id:793}, properties:{}}, {start: {_id:805}, end: {_id:793}, properties:{}}, {start: {_id:806}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:805}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVESTIGATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:917}, end: {_id:907}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RESEARCHER_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:917}, end: {_id:912}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ALUMNI_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:44}, end: {_id:42}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CORRESPONDING_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:902}, end: {_id:912}, properties:{}}, {start: {_id:920}, end: {_id:912}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GRADUATE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:902}, end: {_id:904}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RESEARCH_HIGHLIGHT]->(end) SET r += row.properties;
UNWIND [{start: {_id:306}, end: {_id:312}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING_AGENCY]->(end) SET r += row.properties;
UNWIND [{start: {_id:664}, end: {_id:717}, properties:{}}, {start: {_id:675}, end: {_id:713}, properties:{}}, {start: {_id:683}, end: {_id:688}, properties:{}}, {start: {_id:691}, end: {_id:717}, properties:{}}, {start: {_id:701}, end: {_id:688}, properties:{}}, {start: {_id:701}, end: {_id:704}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUBSTANCE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:45}, end: {_id:49}, properties:{}}, {start: {_id:46}, end: {_id:44}, properties:{}}, {start: {_id:46}, end: {_id:45}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EQUAL_CONTRIBUTION]->(end) SET r += row.properties;
UNWIND [{start: {_id:902}, end: {_id:903}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLICATIONS]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:34}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTAINS]->(end) SET r += row.properties;
UNWIND [{start: {_id:784}, end: {_id:782}, properties:{}}, {start: {_id:802}, end: {_id:807}, properties:{}}, {start: {_id:805}, end: {_id:798}, properties:{}}, {start: {_id:827}, end: {_id:824}, properties:{}}, {start: {_id:831}, end: {_id:819}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EMAIL]->(end) SET r += row.properties;
UNWIND [{start: {_id:709}, end: {_id:672}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:676}, end: {_id:714}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EMPLOYER]->(end) SET r += row.properties;
UNWIND [{start: {_id:766}, end: {_id:744}, properties:{}}, {start: {_id:766}, end: {_id:755}, properties:{}}, {start: {_id:766}, end: {_id:763}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:886}, end: {_id:889}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:619}, end: {_id:640}, properties:{}}, {start: {_id:630}, end: {_id:644}, properties:{}}, {start: {_id:645}, end: {_id:639}, properties:{}}, {start: {_id:648}, end: {_id:638}, properties:{}}, {start: {_id:653}, end: {_id:638}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:669}, end: {_id:662}, properties:{}}, {start: {_id:690}, end: {_id:662}, properties:{}}, {start: {_id:703}, end: {_id:662}, properties:{}}, {start: {_id:729}, end: {_id:662}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PART_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:242}, end: {_id:256}, properties:{}}, {start: {_id:246}, end: {_id:256}, properties:{}}, {start: {_id:251}, end: {_id:256}, properties:{}}, {start: {_id:253}, end: {_id:256}, properties:{}}, {start: {_id:254}, end: {_id:256}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:101}, end: {_id:148}, properties:{}}, {start: {_id:102}, end: {_id:149}, properties:{}}, {start: {_id:103}, end: {_id:148}, properties:{}}, {start: {_id:104}, end: {_id:190}, properties:{}}, {start: {_id:105}, end: {_id:190}, properties:{}}, {start: {_id:106}, end: {_id:215}, properties:{}}, {start: {_id:107}, end: {_id:171}, properties:{}}, {start: {_id:107}, end: {_id:215}, properties:{}}, {start: {_id:108}, end: {_id:148}, properties:{}}, {start: {_id:108}, end: {_id:164}, properties:{}}, {start: {_id:109}, end: {_id:215}, properties:{}}, {start: {_id:110}, end: {_id:215}, properties:{}}, {start: {_id:111}, end: {_id:211}, properties:{}}, {start: {_id:112}, end: {_id:100}, properties:{}}, {start: {_id:112}, end: {_id:176}, properties:{}}, {start: {_id:113}, end: {_id:171}, properties:{}}, {start: {_id:114}, end: {_id:171}, properties:{}}, {start: {_id:115}, end: {_id:215}, properties:{}}, {start: {_id:116}, end: {_id:215}, properties:{}}, {start: {_id:118}, end: {_id:229}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:119}, end: {_id:229}, properties:{}}, {start: {_id:120}, end: {_id:148}, properties:{}}, {start: {_id:120}, end: {_id:164}, properties:{}}, {start: {_id:121}, end: {_id:211}, properties:{}}, {start: {_id:122}, end: {_id:148}, properties:{}}, {start: {_id:122}, end: {_id:164}, properties:{}}, {start: {_id:122}, end: {_id:215}, properties:{}}, {start: {_id:123}, end: {_id:143}, properties:{}}, {start: {_id:124}, end: {_id:148}, properties:{}}, {start: {_id:124}, end: {_id:164}, properties:{}}, {start: {_id:125}, end: {_id:100}, properties:{}}, {start: {_id:125}, end: {_id:176}, properties:{}}, {start: {_id:126}, end: {_id:152}, properties:{}}, {start: {_id:126}, end: {_id:171}, properties:{}}, {start: {_id:127}, end: {_id:211}, properties:{}}, {start: {_id:128}, end: {_id:152}, properties:{}}, {start: {_id:128}, end: {_id:164}, properties:{}}, {start: {_id:129}, end: {_id:215}, properties:{}}, {start: {_id:130}, end: {_id:148}, properties:{}}, {start: {_id:130}, end: {_id:164}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:131}, end: {_id:193}, properties:{}}, {start: {_id:132}, end: {_id:152}, properties:{}}, {start: {_id:132}, end: {_id:164}, properties:{}}, {start: {_id:132}, end: {_id:174}, properties:{}}, {start: {_id:132}, end: {_id:190}, properties:{}}, {start: {_id:132}, end: {_id:193}, properties:{}}, {start: {_id:132}, end: {_id:207}, properties:{}}, {start: {_id:132}, end: {_id:215}, properties:{}}, {start: {_id:133}, end: {_id:171}, properties:{}}, {start: {_id:134}, end: {_id:215}, properties:{}}, {start: {_id:136}, end: {_id:152}, properties:{}}, {start: {_id:136}, end: {_id:156}, properties:{}}, {start: {_id:137}, end: {_id:190}, properties:{}}, {start: {_id:137}, end: {_id:215}, properties:{}}, {start: {_id:138}, end: {_id:148}, properties:{}}, {start: {_id:138}, end: {_id:171}, properties:{}}, {start: {_id:139}, end: {_id:156}, properties:{}}, {start: {_id:139}, end: {_id:171}, properties:{}}, {start: {_id:141}, end: {_id:171}, properties:{}}, {start: {_id:142}, end: {_id:143}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:144}, end: {_id:171}, properties:{}}, {start: {_id:145}, end: {_id:215}, properties:{}}, {start: {_id:146}, end: {_id:149}, properties:{}}, {start: {_id:147}, end: {_id:229}, properties:{}}, {start: {_id:150}, end: {_id:215}, properties:{}}, {start: {_id:151}, end: {_id:215}, properties:{}}, {start: {_id:153}, end: {_id:148}, properties:{}}, {start: {_id:153}, end: {_id:164}, properties:{}}, {start: {_id:154}, end: {_id:215}, properties:{}}, {start: {_id:155}, end: {_id:152}, properties:{}}, {start: {_id:155}, end: {_id:171}, properties:{}}, {start: {_id:157}, end: {_id:152}, properties:{}}, {start: {_id:157}, end: {_id:164}, properties:{}}, {start: {_id:157}, end: {_id:174}, properties:{}}, {start: {_id:157}, end: {_id:190}, properties:{}}, {start: {_id:157}, end: {_id:193}, properties:{}}, {start: {_id:157}, end: {_id:207}, properties:{}}, {start: {_id:157}, end: {_id:215}, properties:{}}, {start: {_id:158}, end: {_id:215}, properties:{}}, {start: {_id:160}, end: {_id:215}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:161}, end: {_id:143}, properties:{}}, {start: {_id:162}, end: {_id:229}, properties:{}}, {start: {_id:165}, end: {_id:193}, properties:{}}, {start: {_id:166}, end: {_id:229}, properties:{}}, {start: {_id:167}, end: {_id:171}, properties:{}}, {start: {_id:168}, end: {_id:211}, properties:{}}, {start: {_id:169}, end: {_id:156}, properties:{}}, {start: {_id:169}, end: {_id:171}, properties:{}}, {start: {_id:170}, end: {_id:190}, properties:{}}, {start: {_id:172}, end: {_id:211}, properties:{}}, {start: {_id:173}, end: {_id:215}, properties:{}}, {start: {_id:175}, end: {_id:148}, properties:{}}, {start: {_id:175}, end: {_id:164}, properties:{}}, {start: {_id:177}, end: {_id:171}, properties:{}}, {start: {_id:178}, end: {_id:215}, properties:{}}, {start: {_id:179}, end: {_id:143}, properties:{}}, {start: {_id:180}, end: {_id:190}, properties:{}}, {start: {_id:181}, end: {_id:171}, properties:{}}, {start: {_id:182}, end: {_id:148}, properties:{}}, {start: {_id:182}, end: {_id:164}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:183}, end: {_id:229}, properties:{}}, {start: {_id:185}, end: {_id:176}, properties:{}}, {start: {_id:186}, end: {_id:171}, properties:{}}, {start: {_id:187}, end: {_id:215}, properties:{}}, {start: {_id:188}, end: {_id:215}, properties:{}}, {start: {_id:191}, end: {_id:148}, properties:{}}, {start: {_id:191}, end: {_id:164}, properties:{}}, {start: {_id:192}, end: {_id:148}, properties:{}}, {start: {_id:194}, end: {_id:171}, properties:{}}, {start: {_id:197}, end: {_id:171}, properties:{}}, {start: {_id:198}, end: {_id:171}, properties:{}}, {start: {_id:200}, end: {_id:143}, properties:{}}, {start: {_id:201}, end: {_id:193}, properties:{}}, {start: {_id:202}, end: {_id:215}, properties:{}}, {start: {_id:203}, end: {_id:148}, properties:{}}, {start: {_id:203}, end: {_id:164}, properties:{}}, {start: {_id:204}, end: {_id:174}, properties:{}}, {start: {_id:204}, end: {_id:207}, properties:{}}, {start: {_id:205}, end: {_id:171}, properties:{}}, {start: {_id:206}, end: {_id:143}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:208}, end: {_id:215}, properties:{}}, {start: {_id:209}, end: {_id:156}, properties:{}}, {start: {_id:210}, end: {_id:171}, properties:{}}, {start: {_id:212}, end: {_id:215}, properties:{}}, {start: {_id:214}, end: {_id:215}, properties:{}}, {start: {_id:216}, end: {_id:148}, properties:{}}, {start: {_id:216}, end: {_id:164}, properties:{}}, {start: {_id:217}, end: {_id:215}, properties:{}}, {start: {_id:218}, end: {_id:152}, properties:{}}, {start: {_id:220}, end: {_id:215}, properties:{}}, {start: {_id:221}, end: {_id:190}, properties:{}}, {start: {_id:221}, end: {_id:193}, properties:{}}, {start: {_id:222}, end: {_id:100}, properties:{}}, {start: {_id:222}, end: {_id:176}, properties:{}}, {start: {_id:223}, end: {_id:148}, properties:{}}, {start: {_id:223}, end: {_id:164}, properties:{}}, {start: {_id:224}, end: {_id:149}, properties:{}}, {start: {_id:225}, end: {_id:148}, properties:{}}, {start: {_id:225}, end: {_id:164}, properties:{}}, {start: {_id:226}, end: {_id:171}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:227}, end: {_id:190}, properties:{}}, {start: {_id:228}, end: {_id:215}, properties:{}}, {start: {_id:230}, end: {_id:211}, properties:{}}, {start: {_id:231}, end: {_id:100}, properties:{}}, {start: {_id:231}, end: {_id:176}, properties:{}}, {start: {_id:233}, end: {_id:190}, properties:{}}, {start: {_id:235}, end: {_id:148}, properties:{}}, {start: {_id:235}, end: {_id:164}, properties:{}}, {start: {_id:236}, end: {_id:171}, properties:{}}, {start: {_id:237}, end: {_id:215}, properties:{}}, {start: {_id:238}, end: {_id:215}, properties:{}}, {start: {_id:240}, end: {_id:148}, properties:{}}, {start: {_id:240}, end: {_id:164}, properties:{}}, {start: {_id:240}, end: {_id:193}, properties:{}}, {start: {_id:241}, end: {_id:171}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CITED]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:78}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ANALYZED_DATA]->(end) SET r += row.properties;
UNWIND [{start: {_id:302}, end: {_id:287}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONCEPTUALIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:34}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:714}, end: {_id:671}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTACT]->(end) SET r += row.properties;
UNWIND [{start: {_id:275}, end: {_id:15}, properties:{}}, {start: {_id:275}, end: {_id:18}, properties:{}}, {start: {_id:275}, end: {_id:264}, properties:{}}, {start: {_id:275}, end: {_id:268}, properties:{}}, {start: {_id:275}, end: {_id:276}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRODUCED]->(end) SET r += row.properties;
UNWIND [{start: {_id:832}, end: {_id:820}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDING]->(end) SET r += row.properties;
UNWIND [{start: {_id:83}, end: {_id:84}, properties:{}}, {start: {_id:83}, end: {_id:85}, properties:{}}, {start: {_id:83}, end: {_id:92}, properties:{}}, {start: {_id:83}, end: {_id:97}, properties:{}}, {start: {_id:83}, end: {_id:98}, properties:{}}, {start: {_id:90}, end: {_id:84}, properties:{}}, {start: {_id:90}, end: {_id:85}, properties:{}}, {start: {_id:90}, end: {_id:92}, properties:{}}, {start: {_id:90}, end: {_id:97}, properties:{}}, {start: {_id:90}, end: {_id:98}, properties:{}}, {start: {_id:95}, end: {_id:84}, properties:{}}, {start: {_id:95}, end: {_id:85}, properties:{}}, {start: {_id:95}, end: {_id:92}, properties:{}}, {start: {_id:95}, end: {_id:97}, properties:{}}, {start: {_id:95}, end: {_id:98}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FUNDED]->(end) SET r += row.properties;
UNWIND [{start: {_id:44}, end: {_id:47}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CORRESPONDING_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:288}, end: {_id:287}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:`X-RAY_CT_ANALYSIS`]->(end) SET r += row.properties;
UNWIND [{start: {_id:776}, end: {_id:791}, properties:{}}, {start: {_id:784}, end: {_id:791}, properties:{}}, {start: {_id:802}, end: {_id:791}, properties:{}}, {start: {_id:805}, end: {_id:791}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WRITING]->(end) SET r += row.properties;
UNWIND [{start: {_id:34}, end: {_id:39}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTAINS]->(end) SET r += row.properties;
UNWIND [{start: {_id:795}, end: {_id:793}, properties:{}}, {start: {_id:805}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DATA_CURATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:61}, end: {_id:75}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:WORKS_AT]->(end) SET r += row.properties;
UNWIND [{start: {_id:664}, end: {_id:681}, properties:{}}, {start: {_id:691}, end: {_id:681}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:USED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:801}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:902}, end: {_id:918}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AWARD_RECIPIENT]->(end) SET r += row.properties;
UNWIND [{start: {_id:614}, end: {_id:621}, properties:{}}, {start: {_id:616}, end: {_id:43}, properties:{}}, {start: {_id:618}, end: {_id:617}, properties:{}}, {start: {_id:623}, end: {_id:621}, properties:{}}, {start: {_id:628}, end: {_id:621}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AFFILIATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:913}, end: {_id:907}, properties:{}}, {start: {_id:913}, end: {_id:912}, properties:{}}, {start: {_id:919}, end: {_id:907}, properties:{}}, {start: {_id:919}, end: {_id:914}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STUDENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:777}, end: {_id:793}, properties:{}}, {start: {_id:780}, end: {_id:793}, properties:{}}, {start: {_id:785}, end: {_id:793}, properties:{}}, {start: {_id:805}, end: {_id:793}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:METHODOLOGY]->(end) SET r += row.properties;
UNWIND [{start: {_id:696}, end: {_id:667}, properties:{}}, {start: {_id:720}, end: {_id:679}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXAMPLE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPONENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:968}, end: {_id:981}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PLACED_BETWEEN]->(end) SET r += row.properties;
UNWIND [{start: {_id:674}, end: {_id:711}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ATTRIBUTE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:33}, end: {_id:32}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PROPOSED]->(end) SET r += row.properties;
UNWIND [{start: {_id:786}, end: {_id:796}, properties:{}}, {start: {_id:804}, end: {_id:790}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PERFORMED]->(end) SET r += row.properties;
UNWIND [{start: {_id:34}, end: {_id:39}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:886}, end: {_id:881}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:997}, end: {_id:993}, properties:{}}, {start: {_id:1022}, end: {_id:993}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:684}, end: {_id:728}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:COMPONENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:304}, end: {_id:327}, properties:{}}, {start: {_id:877}, end: {_id:881}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CORRESPONDING_AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:963}, end: {_id:986}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUBJECTED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:277}, end: {_id:269}, properties:{}}, {start: {_id:277}, end: {_id:272}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MODIFIED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:319}, end: {_id:305}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PUBLISHED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:549}, end: {_id:578}, properties:{}}, {start: {_id:597}, end: {_id:587}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIER]->(end) SET r += row.properties;
UNWIND [{start: {_id:663}, end: {_id:726}, properties:{}}, {start: {_id:677}, end: {_id:716}, properties:{}}, {start: {_id:721}, end: {_id:725}, properties:{}}, {start: {_id:723}, end: {_id:702}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXAMPLE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:707}, end: {_id:728}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ATTRIBUTE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:843}, end: {_id:840}, properties:{}}, {start: {_id:843}, end: {_id:841}, properties:{}}, {start: {_id:843}, end: {_id:844}, properties:{}}, {start: {_id:843}, end: {_id:846}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:949}, end: {_id:924}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ADDED_INTO]->(end) SET r += row.properties;
UNWIND [{start: {_id:958}, end: {_id:927}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INVESTIGATED_FOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:693}, end: {_id:711}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TYPE_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:304}, end: {_id:305}, properties:{}}, {start: {_id:308}, end: {_id:305}, properties:{}}, {start: {_id:313}, end: {_id:305}, properties:{}}, {start: {_id:322}, end: {_id:305}, properties:{}}, {start: {_id:328}, end: {_id:305}, properties:{}}, {start: {_id:329}, end: {_id:305}, properties:{}}, {start: {_id:996}, end: {_id:994}, properties:{}}, {start: {_id:997}, end: {_id:1011}, properties:{}}, {start: {_id:1010}, end: {_id:994}, properties:{}}, {start: {_id:1019}, end: {_id:994}, properties:{}}, {start: {_id:1022}, end: {_id:1011}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:AUTHOR]->(end) SET r += row.properties;
UNWIND [{start: {_id:778}, end: {_id:779}, properties:{}}, {start: {_id:792}, end: {_id:779}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTRIBUTED]->(end) SET r += row.properties;
UNWIND [{start: {_id:909}, end: {_id:910}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:POST_DOCTORAL_RESEARCHER_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:40}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ISSUED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:541}, end: {_id:582}, properties:{}}, {start: {_id:544}, end: {_id:573}, properties:{}}, {start: {_id:555}, end: {_id:550}, properties:{}}, {start: {_id:602}, end: {_id:599}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SUPPLIER]->(end) SET r += row.properties;
UNWIND [{start: {_id:955}, end: {_id:983}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:FABRICATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:71}, end: {_id:59}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CHARACTERIZED]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
