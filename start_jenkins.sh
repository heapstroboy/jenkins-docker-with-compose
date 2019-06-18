#!/usr/bin/env bash

#clean anything with same name
docker-compose down

#set the correct password
echo -n Password: 
read -s pass
echo $pass > ./secrets/dockerhubPassword

#update older jenkins image, make sure it doesnt use cache
docker-compose build --no-cache

#run jenkins
docker-compose up -d

#remove password form local
rm ./secrets/dockerhubPassword
