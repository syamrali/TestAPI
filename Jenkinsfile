node {
    def imageName = 'my-docker-image'
    def imageTag = 'latest'
    
    // Build Docker image
    stage('Build Docker Image') {
        checkout scm
        sh "docker build -t ${imageName}:${imageTag} ."
    }
    
    // Run Docker container
    stage('Run Docker Container') {
        sh "docker run -d --name ${imageName} -p 5000:5000 ${imageName}:${imageTag}"
    }
    
    // Display container logs
    stage('Display Logs') {
        sh "docker logs ${imageName}"
    }
    
    // Cleanup
    stage('Clean Up') {
        sh "docker stop ${imageName} || true"
        sh "docker rm ${imageName} || true"
    }
}
