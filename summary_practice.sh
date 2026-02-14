#!bin/bash/env bash
####################################
# Created by: Bibi
# Purpose: homework
# Date: 2026-02-14
# Version: 0.0.1
set -o errexit
set -o pipefail
set -o nounset
###################################
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)
docker network create vaio-net
docker run -dit --name alpine --network vaio-net alpine
docker run -dit --network vaio-net nginx
docker run -dit --name apache ubuntu/apache2
docker exec alpine ping apache
docker network connect vaio-net apache 
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

