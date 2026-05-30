# Build stage using standard OpenJDK
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copy your source files
COPY . .

# Compile the Java files and package them into a runnable JAR file
RUN javac App.java AppTest.java && \
    echo "Main-Class: App" > manifest.txt && \
    jar cvfm app.jar manifest.txt App.class AppTest.class

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the standalone JAR from the build stage
COPY --from=build /app/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
