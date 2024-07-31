# Introduction

this project implement social mining algorithms for the web of authors

# Usage

## Install prerequisite packages

```shell
sudo apt install ruby-rubygems ruby-dev
sudo gem install anystyle-cli
python3 -m pip install -r requirements.txt
```

download jar of apoc from [official github](https://github.com/neo4j/apoc/releases/tag/5.19.0)

download jar of neosemantics from [official github](https://github.com/neo4j-labs/neosemantics/releases)

install neo4j with the following commands

```shell
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.com stable latest' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt update
sudo apt install daemon cypher-shell neo4j
sudo cp <path/to/downloaded/apoc/jar> /var/lib/neo4j/plugins
sudo cp <path/to/downloaded/neosemantics/jar> /var/lib/neo4j/plugins
sudo echo "dbms.directories.plugins=/var/lib/neo4j/plugins" >> /etc/neo4j/neo4j.conf
sudo echo "dbms.security.procedures.unrestricted=algo.*,apoc.*" >> /etc/neo4j/neo4j.conf
sudo echo "dbms.unmanaged_extension_classes=n10s.endpoint=/rdf" >> /etc/neo4j/neo4j.conf
sudo echo "server.default_listen_address=0.0.0.0" >> /etc/neo4j/neo4j.conf
sudo systemctl start neo4j
sudo systemctl status neo4j
```

## Create Knowledge Base

```shell
python3 create_web.py --list <path/to/xls> --paper_dir <path/to/pdf/directory>
bash run_cypher.sh
```

## Calculate on the Knowledge Base

```shell
python3 page_rank.py [--host <host>] [--user <user>] [--password <password>] [--db <db>]
```

Upon executing the script successfully, there will be 3 new files generated.

| file | description |
|------|-------------|
|total_citation.npz|dataframe storing total citation number of papers coauthored by the author pairs |
|author_weights.pkl|author weight calculated by page rank |
|connected_components.pkl| connect components |
|authors.pkl| map from elementid to author name |
