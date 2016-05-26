FROM alpine:latest

MAINTAINER johannk 
 

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --update \
    curl openjdk8-jre-base bash \
    && rm /var/cache/apk/*
ADD hadoop-2.7.2.tar.gz /usr/local
	
#RUN curl -s http://www.us.apache.org/dist/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.7.2 hadoop


ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre 
ENV PATH $PATH:$JAVA_HOME/bin:/usr/local/hadoop/bin
 
ADD yarn-site.xml.template /usr/local/hadoop/etc/hadoop/yarn-site.xml 
ADD core-site.xml.template /usr/local/hadoop/etc/hadoop/core-site.xml 
ADD hello-samza /usr/local/samza
ADD grizzled-slf4j_2.10-1.0.1.jar /usr/local/hadoop/share/hadoop/hdfs/lib
ADD scala-compiler.jar /usr/local/hadoop/share/hadoop/hdfs/lib
ADD scala-library.jar /usr/local/hadoop/share/hadoop/hdfs/lib
 
VOLUME /usr/local/hadoop/logs
# Expose Ports 
EXPOSE 8042 8088 19888
  
#hostname muss hadoop sein
COPY master.sh /
COPY slave.sh /
#ENTRYPOINT ["/entrypoint.sh"]
