#yes
FROM docker.io/library/maven:3.9.6-eclipse-temurin-21 AS cache
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn dependency:go-offline

FROM docker.io/library/maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY --from=cache /root/.m2 /root/.m2
COPY . .
RUN mvn package -DskipTests

FROM docker.io/library/maven:3.9.6-eclipse-temurin-21 as runner
WORKDIR	/app
COPY --from=build /app/target/*.jar /app/app.jar
CMD ["java", "-jar", "app.jar"]
