# base smallest image alpine
FROM ubuntu
MAINTAINER maysham <chinasoft_lgh@outlook.com>

ADD jdk-8u191-linux-x64.tar.gz /java
ADD hbase-2.1.1-bin.tar.gz /hbase

ENV JAVA_HOME /java/jdk1.8.0_191
ENV JRE_HOME /java/jdk1.8.0_191/jre
ENV HBASE_HOME /hbase/hbase-2.1.1
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$HBASE_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y openssh-server openssh-client && \
    addgroup hadoop && \
    useradd -m hadoop -g hadoop -p qazwsx && \
    chown -R hadoop:hadoop /hbase/hbase-2.1.1 && \
    cd /etc/sudoers.d && sudo touch nopasswdsudo && echo "hadoop ALL=(ALL) NOPASSWD : ALL" >> nopasswdsudo && \
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

USER hadoop
EXPOSE  22 2181 16010
CMD /usr/sbin/sshd -D
ENTRYPOINT /bin/bash