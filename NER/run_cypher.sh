#!/bin/bash

HOST="bolt://localhost:7687"
USERNAME="neo4j"
PASSWORD="19841124"
DATABASE="neo4j"

cat output.cypher | cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE"

