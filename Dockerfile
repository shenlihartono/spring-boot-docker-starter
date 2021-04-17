# Build stage
FROM maven:3.6.0-jdk-8-slim AS build
ARG HOME=/Users/shenlihartono
COPY src ${HOME}/app/src
COPY pom.xml ${HOME}/app
RUN mvn -f ${HOME}/app/pom.xml clean package

# Package stage
FROM openjdk:8-jre-slim
ARG HOME=/Users/shenlihartono
COPY --from=build ${HOME}/app/target/demo-1.0.0-SNAPSHOT.jar /usr/local/lib/demo.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]