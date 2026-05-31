pipeline {
    agent any

    tools {
        // Ensures 'maven' is configured in Jenkins Global Tool Configuration
        maven "maven" 
    }

    stages {
        stage('test') {
            steps {
                script {
                    echo "Running Tests of branch $BRANCH_NAME"
                }
            }
        }

        stage('Build') {
            when {
                expression {
                    return BRANCH_NAME == 'main'
                }
            }
            steps {
                echo "Building the application"
                // Tip: If you want to use maven here, you'd add: sh 'mvn clean package'
            }
        }

        stage('deploy') {
            steps {
                script {
                    def dockercmd = 'docker run -p 3080:3080 shoukatali175249/jma:jma-1.3'
                    
                    // Ensure 'ec2' is the correct Credentials ID in your Jenkins store
                    sshagent(['ec2']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@56.228.26.9 '${dockercmd}'"
                    }
                }
            }
        }
    }
}
