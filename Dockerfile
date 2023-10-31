FROM registry.access.redhat.com/ubi8/openjdk-11

COPY target/springboot-docker-demo-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java","-jar","/springboot-docker-demo-0.0.1-SNAPSHOT.jar"]
