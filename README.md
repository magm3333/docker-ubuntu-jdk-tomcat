# Dockerfiles para crear imágenes de JDK y Apache Tomcat

**Crear Imagenes de Java**
Una vez clonado este repositorio deberá:
- Descargar la versión del JDK de Oracle y asegurate que poseá este nombre: *jdk-linux-x64.tar.gz* en la carpeta *jdk* [aquí](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html), tanmbién [aquí](https://gist.github.com/hgomez/9650687) hay una serie de comandos para descargarlo con wget, por ejemplo.
> wget https://github.com/frekele/oracle-java/releases/download/8u201-b09/jdk-8u201-linux-x64.tar.gz -O jdk-linux-x64.tar.gz 
- Finalmente, crear la imagen:

```
docker build -t jdk8 .
```

**Crear imágenes de Apache Tomcat**

Para ello existen dos scipts:
- ```tomcat/build8.sh```
- ```tomcat/build9.sh```

Ambos scripts se basan en las imagenes: *magm3333/ubuntu18.04-jdk:8* y *magm3333/ubuntu22.04-jdk:11* respectivamente
> Los scripts anteriores poseen variables de entorno que pueden ser modificadas a fin de crear imágenes de sub versiones específicas de tomcat 8 y 9, estas variables son: *VERSION_P* y *VERSION_S*


**Crear contenedores**

Básico:
```
docker run -it -p 8080:8080 --name tomcat magm3333/tomcat:9.0.36
```

Externalizando tus propias aplicaciones:
```
docker run -it -p 8080:8080 --name tomcat -v /path/a/tu/webapps:/opt/tomcat/webapps magm3333/tomcat:9.0.65
```

Estableciendo valores de configuración customizados (*setenv.sh*):
```
docker run -it -p 8080:8080 --name tomcat /path/a/tu//setenv.sh:/opt/tomcat/bin/setenv.sh -v /path/a/tu/webapps:/opt/tomcat/webapps magm3333/tomcat:9.0.65
```
---

**Licencia**

Creado por Mariano Alberto García Mattío en 2020 (Twitter [@magm3333](https://twitter.com/magm3333))

Licensed under the Apache License, Version 2.0
