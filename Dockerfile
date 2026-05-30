# Build stage
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven files first for better layer caching
COPY . .

RUN mvn -q -DskipTests package

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built jar
# For this simple demo we rely on maven's jar output name.
COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8080

# Note: This demo app is console-based; it doesn't listen on 8080.
# We still keep EXPOSE for learning purposes.
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

