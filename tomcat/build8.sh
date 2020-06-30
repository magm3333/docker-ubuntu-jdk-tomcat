#!/bin/sh
VERSION_P=8
VERSION_S=5.56
JDK_VERSION=8
docker build --build-arg JDK_VER=$JDK_VERSION --build-arg VER_P=$VERSION_P --build-arg VER_S=$VERSION_S -t magm3333/tomcat:$VERSION_P.$VERSION_S .
