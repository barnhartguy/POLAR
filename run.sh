#!/bin/bash
echo "Removing old containers"
docker stop neo4j polar 2>/dev/null
docker rm neo4j polar 2>/dev/null

echo "setup the neo4j instance"
docker run -d --rm --name neo4j --publish 7474:7474 --publish 7473:7473 --publish 7687:7687 neo4j:3.0
secs=$((5))
while [ $secs -gt 0 ]; do
   echo -ne "."
   sleep 1
   : $((secs--))
done
curl -H "Content-Type: application/json" -d '{"password":"test"}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password 

echo "push data to the neo4j instance"
docker run -it --name polar --link neo4j polar_img:1 python scan_data_dir.py
echo "complete"
echo
echo "Use neo4j:test to log into http://localhost:7474"