pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = credentials('likhraj') 
        DOCKERHUB_PASSWORD = credentials('Docker@2001')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building the Docker image...'
                    bat 'docker build -t likhraj/mlproject:latest .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    bat 'python test.py'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Pushing the Docker image to Docker Hub...'
                    bat 'echo %DOCKERHUB_PASSWORD% | docker login -u %DOCKERHUB_USERNAME% --password-stdin'
                    bat 'docker push likhraj/mlproject:latest'
                }
            }
        }
    }
}
