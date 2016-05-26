FROM alpine:latest

MAINTAINER johannk 
 

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --update \
    curl openjdk8-jre-base bash python \
    && rm /var/cache/apk/*
ADD apache-storm-1.0.1.tar.gz /usr/local
	
#RUN curl -s http://www.apache.org/dyn/closer.lua/storm/apache-storm-1.0.1/apache-storm-1.0.1.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./apache-storm-1.0.1 storm


ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre 
ENV PATH $PATH:$JAVA_HOME/bin
ADD storm.yaml /usr/local/apache-storm-1.0.1/conf/storm.yaml 
#ein volume wird bestimmt benötigt aber den pfad muss ich noch herausfinden 
#VOLUME /mnt/storm
# Expose Ports 
EXPOSE 6700 6701 6702 6703 8080
  