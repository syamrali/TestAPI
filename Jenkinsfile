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
    
   stage('Display Logs') {
        // Start a background process to continuously display logs
        def logProcess = sh(script: "docker logs -f ${containerName}", returnStatus: true, background: true)

        // Keep the pipeline running while logs are being displayed
        while (logProcess.isRunning()) {
            sleep(time: 30, unit: 'SECONDS') // Adjust sleep duration as needed
        }

        // Wait for the log display to finish before moving on
        logProcess.join()
    }
   
}
