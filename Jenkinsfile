pipeline {
    agent any

    tools {
        maven "maven"
    }

    stages {

        stage('test') {
            steps {
                script {
                echo "Running Tests of bransh $BRANCH_NAME"

                }
            }
        }
        stage('Build') {
            when{
                expression{
                    BRANCH_NAME == 'main'
                }
            }
            steps{
                echo "Building the application"
            }
        }
           stage('deploy') {
            when{
                expression{
                    BRANCH_NAME == 'main'
                }
            }
            steps{
                echo "Deploying the application"
            }
        }
    }
}
