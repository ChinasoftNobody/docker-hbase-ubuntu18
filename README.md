# docker-hbase-ubuntu
This project is base hbase image for ubuntu, you can run a docker container on this image to init a apache hbase 2.1.1 
with default configuration.
## Get to start
If you build this project to make your own image.
Also you can use docker pull to get the image.

### build the project to make a image
you need prepare jdk and hbase package

    sudo wget http://mirror.bit.edu.cn/apache/hbase/2.1.1/hbase-2.1.1-bin.tar.gz
    sudo wget https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz

then build it

    sudo docker build -t <your tag name> .
    
### run a container on the image
You can pull the image from cloud.docker.com/hub.docker.com
    
    sudo docker pull maysham/hbase
    sudo docker run --name name -p 2181:2181 -p 16010:16010 maysham/hbase
