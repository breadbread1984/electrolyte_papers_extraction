#!/bin/bash

HOST="bolt://localhost:7687"
USERNAME="neo4j"
PASSWORD="neo4j"
DATABASE="neo4j"

cat output.cypher | cypher-shell -a "$HOST" -u "$USERNAME" -p "$PASSWORD" -d "$DATABASE"

