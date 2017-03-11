FROM alpine:latest
MAINTAINER johannk

ENV http_proxy http://160.46.99.199:3128
ENV https_proxy http://160.46.99.199:3128
ENV HTTP_PROXY  http://160.46.99.199:3128
ENV HTTPS_PROXY  http://160.46.99.199:3128
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --update \
    curl openjdk8-jre-base bash supervisor parallel \
    && rm /var/cache/apk/*

RUN parallel 'echo {} && curl -# http://www-eu.apache.org/dist/{} | tar -xz -C /usr/local/' ::: \
	hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz\
	kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz\
	zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz\
	storm/apache-storm-1.0.1/apache-storm-1.0.1.tar.gz && \
	cd /usr/local/ && \
	ln -s hadoop-2.7.2 hadoop && \
	ln -s zookeeper-3.4.8 zookeeper && \
	ln -s kafka_2.11-0.10.0.0 kafka && \
	ln -s apache-storm-1.0.1 storm
	
ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre 
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV ZOOKEEPER_HOME /usr/local/zookeeper
ENV KAFKA_HOME /usr/local/kafka 
ENV STORM_HOME /usr/local/storm 
ENV REST_HOME /usr/local/rest 
ENV SAMZA_HOME /etc/pocsp/jobs

  
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/sbin:$ZOOKEEPER_HOME/bin:$KAFKA_HOME/bin:$STORM_HOME/bin
  
COPY conf/yarn/* $HADOOP_HOME/etc/hadoop/
COPY conf/kafka/* $KAFKA_HOME/config/
COPY conf/zookeeper/* $ZOOKEEPER_HOME/conf/
COPY conf/supervisor/* /etc/
COPY conf/storm/* $STORM_HOME/conf/
COPY conf/bin/* /usr/local/bin/
COPY jobs/* $SAMZA_HOME/
ADD  jobs/*.tar.gz $SAMZA_HOME/
COPY rest/* $REST_HOME/ 
COPY transmitter/* /usr/local/transmitter/ 
RUN chmod 700 /usr/local/bin/*


VOLUME /tmp
