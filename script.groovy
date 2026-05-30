def showBuildInfo() {
    echo "================================="
    echo "DevOps Pipeline Started"
    echo "================================="
}

def buildApplication() {
    echo "Compiling source code..."
    sleep(2)
    echo "Build completed"
}

def runTests() {
    echo "Running unit tests..."
    sleep(2)
    echo "All tests passed"
}

def codeQualityCheck() {
    echo "Running code quality scan..."
    sleep(2)
    echo "Quality gate passed"
}

def deployApplication(environment) {
    echo "Deploying application to ${environment}"
    sleep(2)
    echo "Deployment completed"
}

def verifyDeployment() {
    echo "Performing health checks..."
    sleep(2)
    echo "Application is healthy"
}

return this
