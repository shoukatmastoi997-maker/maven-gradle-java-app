# devops-demo (Maven Java)

Simple Java console application built with **Maven**.

## Build & test

```bash
mvn test
```

## Run locally

```bash
mvn -q -DskipTests package
java -cp target/classes com.example.App
```

> Note: This app is console-based (not an HTTP server).

## Docker

```bash
docker build -t devops-demo:latest .
docker run --rm devops-demo:latest
```

## Kubernetes

```bash
kubectl apply -f k8s/deployment.yaml
# service is included for learning, but the app is not an HTTP server.
kubectl apply -f k8s/service.yaml
```

