docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume prune -f
docker system prune -f

