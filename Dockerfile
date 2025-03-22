# Use an official OpenJDK image as the base image for building
FROM maven:3.9.8-eclipse-temurin-21 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and project files
COPY . .

# Required to run ./mvnw
RUN mvn wrapper:wrapper


# Give execute permissions to mvnw
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Use a lightweight JDK image for running the app
FROM eclipse-temurin:17-jre

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=build /app/target/*.jar app.jar

# Expose the application's port (modify as per your app)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
