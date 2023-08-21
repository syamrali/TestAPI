pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile in the repository
                script {
                    def dockerImage = docker.build('my-app:${env.BUILD_NUMBER}')
                }
            }
        }
        
        stage('Deploy to Docker') {
            steps {
                // Run the Docker container from the built image
                script {
                    def appContainer = dockerImage.run('-p 8080:80 -d')
                }
            }
        }
    }

    post {
        always {
            // Clean up resources (stop and remove containers, etc.)
            script {
                appContainer.stop()
                appContainer.remove()
            }
        }
    }
}
