FROM magm3333/ubuntu18.04-jdk:8
MAINTAINER Mariano Alberto García Mattío

ENV VERSION_P 8
ENV VERSION_S 5.56
ENV URL_DOWNLOAD_TOMCAT https://apache.dattatec.com/tomcat/tomcat-${VERSION_P}/v${VERSION_P}.${VERSION_S}/bin/apache-tomcat-${VERSION_P}.${VERSION_S}.tar.gz

RUN apt update
RUN apt install wget unzip -y

RUN wget ${URL_DOWNLOAD_TOMCAT} -O /opt/tomcat.tar.gz

RUN tar -pxvzf /opt/tomcat.tar.gz -C /opt
RUN mv /opt/apache-tomcat-${VERSION_P}.${VERSION_S} /opt/tomcat
RUN chmod +x /opt/tomcat/bin/*.sh
RUN sed -i -e 's/\(exec ".*"\) start/\1 run/' /opt/tomcat/bin/startup.sh

RUN rm /opt/tomcat.tar.gz


EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/startup.sh"]
