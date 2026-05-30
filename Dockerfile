# Build stage
FROM gradle:8.12-jdk17 AS build
WORKDIR /app

# Copy the project files
COPY . .

# Grant execution rights and build the JAR (skipping tests for speed)
RUN chmod +x ./gradlew && ./gradlew build -x test

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Gradle puts built JARs inside the build/libs directory
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
