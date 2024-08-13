node {
    def app

    stage('Clone repository') {
        /* Cloning the repository into the workspace */
        checkout scm
    }

    stage('Build Docker Image') {
        /* Building the Docker image */
        app = docker.build("kidney-classification-app", "-f Dockerfile .")
    }

    stage('Run Docker Container') {
        /* Running the Docker container */
        app.run("-d -p 8501:8501")
    }

    stage('Push Docker Image') {
        /* Pushing the Docker image to Docker Hub */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-likhraj') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
