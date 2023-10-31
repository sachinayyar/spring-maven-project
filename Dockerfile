FROM openjdk:8-jdk-alpine
MAINTAINER baeldung.com
COPY target/springboot-docker-demo-0.0.1-SNAPSHOT.jar springboot-docker-demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/springboot-docker-demo-0.0.1-SNAPSHOT.jar"]
