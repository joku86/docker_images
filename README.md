# Dockerfiles#


----
## How to Build Images from files? 

Run this command:
>docker build -t kafka:latest -f Path/to/the/dockerfile/Kafka_Dockerfile Path/to/the/dockerfile

##Build Container Infrastructure 
create network
>docker network create networkname:   

start the container inside the created network  

> docker run -itd -P --net=networkname --name zookeeper -h zookeeper zookeeper /bin/bash    

Second container:

> docker run -itd -P --net=networkname --name kafka -h kafka kafka /bin/bash

