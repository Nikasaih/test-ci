# # FROM eclipse-temurin:21-jdk-alpine
# # FROM openjdk:21
# FROM gradle:jdk21
# WORKDIR /app
# COPY . .
# RUN chmod 777 /app/gradlew
# # RUN /app/gradlew build
# RUN ./gradlew build --no-daemon
# # # RUN gradle 
# # # RUN gradle build
# # RUN chmod 777 /app/build/libs/IAM-0.0.1-SNAPSHOT.jar
# # #ENTRYPOINT [ "sleep","infinity" ]
# # ENTRYPOINT ["java","-jar","/app/build/libs/IAM-0.0.1-SNAPSHOT.jar"]



# Stage 1: Build the application using AMD64-based image
FROM amd64/openjdk:21-jdk-slim AS builder

# Set working directory
WORKDIR /app
COPY . .
RUN chmod 777 /app/gradlew

# Build the application
RUN ./gradlew build

# Stage 2: Run the application using ARM64-based image
FROM arm64v8/openjdk:21-jdk-slim AS runner

# Copy built application from builder stage
COPY --from=builder /app/build /app/build

# Expose the port if needed
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java","-jar","/app/build/libs/IAM-0.0.1-SNAPSHOT.jar"]
