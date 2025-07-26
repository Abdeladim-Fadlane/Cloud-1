docker stop $(docker ps -q)

docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
docker volume rm $(docker volume ls -q)

echo -e "Docker system cleaned up."
docker system df 