pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-likhraj') 
        DOCKERHUB_PASSWORD = credentials('dockerhub-Docker@2001')
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    bat 'docker build -t kidney-classification-app .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    echo 'Running Docker container...'
                    bat 'docker run -d -p 8501:8501 kidney-classification-app'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    bat 'python app.py' // Assuming 'model.py' is your test script
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    echo 'Logging in to Docker Hub...'
                    bat 'echo %DOCKERHUB_PASSWORD% | docker login -u %DOCKERHUB_USERNAME% --password-stdin'
                    
                    echo 'Pushing the Docker image to Docker Hub...'
                    bat 'docker tag kidney-classification-app likhraj/mlproject:latest'
                    bat 'docker push likhraj/mlproject:latest'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
