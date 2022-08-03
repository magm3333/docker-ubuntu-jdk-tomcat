FROM ubuntu:22.04
MAINTAINER Mariano Alberto García Mattío

RUN apt update
RUN apt install curl tzdata wget unzip -y
ENV TZ="America/Argentina/Buenos_Aires"
WORKDIR /tmp
COPY install-java.sh .
COPY jdk-linux-x64.tar.gz .

RUN ./install-java.sh -f jdk-linux-x64.tar.gz

RUN rm /tmp/jdk-linux-x64.tar.gz
