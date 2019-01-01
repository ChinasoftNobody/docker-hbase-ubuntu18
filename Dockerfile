# base smallest image ubuntu
FROM ubuntu
MAINTAINER maysham <chinasoft_lgh@outlook.com>

ADD hbase-2.1.1-bin.tar.gz /hbase
ADD jdk-8u191-linux-x64.tar.gz /java
ADD hadoop-2.9.2.tar.gz /hadoop
COPY hadoop-init.sh /init/
ENV JAVA_HOME /java/jdk1.8.0_191
ENV JRE_HOME /java/jdk1.8.0_191/jre
ENV HADOOP_PREFIX /hadoop/hadoop-2.9.2
ENV HADOOP_NAMENODE_OPTS -XX:+UseParallelGC
ENV HBASE_HOME /hbase/hbase-2.1.1
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$HBASE_HOME/bin:$PATH
WORKDIR /hbase/hbase-2.1.1
EXPOSE  22 2181 16010 16020
ENTRYPOINT /hbase/hbase-2.1.1/bin/start-hbase.sh && echo hello world!! && echo $? >> hello.out && tail -f hello.out