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
        app.run("-d -p 8500:8500")
    }

    stage('Test image') {
        /* Running tests inside the Docker container */
        app.inside {
            sh 'python app.py'  // Replace with your actual test script if different
        }
    }

    stage('Push Docker Image') {
        /* Pushing the Docker image to Docker Hub */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-likhraj') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
