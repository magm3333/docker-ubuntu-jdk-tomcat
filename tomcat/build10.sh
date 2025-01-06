#!/bin/sh

VERSION_P=10
VERSION_S=1.28
JDK_VERSION=17
docker build --build-arg JDK_VER=$JDK_VERSION --build-arg VER_P=$VERSION_P --build-arg VER_S=$VERSION_S -t magm3333/tomcat:$VERSION_P.$VERSION_S .
