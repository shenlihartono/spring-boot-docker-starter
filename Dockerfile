FROM maven:3.5-jdk-8 AS build
ARG APP_LOC=/Users/shenlihartono/Documents/workspace-java/spring-boot-docker-starter
COPY src ${APP_LOC}/src
COPY pom.xml ${APP_LOC}
RUN mvn -f ${APP_LOC}/pom.xml clean package

FROM openjdk:8-jdk-alpine
ARG APP_LOC=/Users/shenlihartono/Documents/workspace-java/spring-boot-docker-starter
COPY --from=build ${APP_LOC}/target/demo-1.0.0-SNAPSHOT.jar /Users/shenlihartono/app/demo-1.0.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/Users/shenlihartono/app/demo-1.0.0-SNAPSHOT.jar"]