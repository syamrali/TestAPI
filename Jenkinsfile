node {
    def imageName = 'my-docker-image'
    def imageTag = 'latest'


    sh "docker stop ${imageName} || true"
    sh "docker rm ${imageName} || true"
    sh "docker rmi ${imageName}:${imageTag} || true"
    
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
   
}
