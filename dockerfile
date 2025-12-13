# Use a lightweight JDK base image
FROM eclipse-temurin:21-jdk-alpine

# Set a working directory inside the container
WORKDIR /app

# Copy the Spring Boot jar file into the container
COPY target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
