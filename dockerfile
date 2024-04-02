#FROM eclipse-temurin:21-jdk-alpine
FROM openjdk:21-jdk-slim-buster
WORKDIR /app
COPY . .
# RUN chmod 777 ./gradlew
RUN ./gradlew build
RUN chmod 777 /app/build/libs/IAM-0.0.1-SNAPSHOT.jar
#ENTRYPOINT [ "sleep","infinity" ]
ENTRYPOINT ["java","-jar","/app/build/libs/IAM-0.0.1-SNAPSHOT.jar"]