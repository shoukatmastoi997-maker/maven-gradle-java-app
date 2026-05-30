# Build stage using standard OpenJDK
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copy your source files
COPY . .

# 1. Use -d . to compile and automatically create the package folder structure (e.g., com/example/)
# 2. Update Main-Class to use the fully qualified class name: com.example.App
RUN javac -d . App.java && \
    echo "Main-Class: com.example.App" > manifest.txt && \
    jar cvfm app.jar manifest.txt com/

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the standalone JAR from the build stage
COPY --from=build /app/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
