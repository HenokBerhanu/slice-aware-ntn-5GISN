echo "CLEAN DOCKER CONTAINER"
docker rm -f $(docker ps -a -q)
docker ps -a -q
echo "CLEAN DOCKER NETWORK"
docker network prune
docker network ls
