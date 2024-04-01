FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY . .

RUN ./gradlew build
RUN chmod 777 /app/build/libs/IAM-0.0.1-SNAPSHOT.jar
#ENTRYPOINT [ "sleep","infinity" ]
ENTRYPOINT ["java","-jar","/app/build/libs/IAM-0.0.1-SNAPSHOT.jar"]