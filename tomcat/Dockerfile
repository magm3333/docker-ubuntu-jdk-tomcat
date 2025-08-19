
ARG JDK_VER=21
FROM magm3333/ubuntu24.04-jdk:$JDK_VER

LABEL maintainer="Mariano Alberto García Mattío"
ARG VER_P
ARG VER_S

ENV VERSION_P=$VER_P
ENV VERSION_S=$VER_S
ENV CATALINA_HOME=/opt/tomcat
#ENV URL_DOWNLOAD_TOMCAT https://apache.dattatec.com/tomcat/tomcat-${VERSION_P}/v${VERSION_P}.${VERSION_S}/bin/apache-tomcat-${VERSION_P}.${VERSION_S}.tar.gz

ENV URL_DOWNLOAD_TOMCAT=https://dlcdn.apache.org/tomcat/tomcat-${VERSION_P}/v${VERSION_P}.${VERSION_S}/bin/apache-tomcat-${VERSION_P}.${VERSION_S}.tar.gz



RUN apt update
RUN apt install wget unzip -y && apt-get clean 

RUN wget ${URL_DOWNLOAD_TOMCAT} -O /opt/tomcat.tar.gz

RUN tar -pxvzf /opt/tomcat.tar.gz -C /opt
RUN mv /opt/apache-tomcat-${VERSION_P}.${VERSION_S} $CATALINA_HOME
RUN chmod +x $CATALINA_HOME/bin/*.sh
RUN sed -i -e 's/\(exec ".*"\) start/\1 run/' $CATALINA_HOME/bin/startup.sh

RUN rm /opt/tomcat.tar.gz
RUN rm -rf \
    $JAVA_HOME/man \
    $JAVA_HOME/sample \
    $JAVA_HOME/demo \
    $JAVA_HOME/jmods \
    $JAVA_HOME/lib/src.zip \
    $CATALINA_HOME/webapps/docs \
    $CATALINA_HOME/webapps/examples \
    $CATALINA_HOME/webapps/ROOT/* \
    /usr/share/doc/* \
    /usr/share/man/* \
    /usr/share/info/* \
    /var/cache/* \
    /var/tmp/* \ 
    /var/lib/apt/lists/* \
    /tmp/*

#RUN rm -rf /opt/tomcat/webapps
#RUN mkdir /opt/tomcat/webapps
#RUN mkdir /opt/tomcat/ROOT

VOLUME /opt/tomcat/bin/setenv.sh

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/startup.sh"]
