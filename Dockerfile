# base smallest image alpine
FROM ubuntu
MAINTAINER maysham <chinasoft_lgh@outlook.com>

ADD jdk-8u191-linux-x64.tar.gz /java
ADD hbase-2.1.1-bin.tar.gz /hbase

ENV JAVA_HOME /java/jdk1.8.0_191
ENV JRE_HOME /java/jdk1.8.0_191/jre
ENV HBASE_HOME /hbase/hbase-2.1.1
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$HBASE_HOME/bin:$PATH

EXPOSE 2181
EXPOSE 16010

ENTRYPOINT hbase master start