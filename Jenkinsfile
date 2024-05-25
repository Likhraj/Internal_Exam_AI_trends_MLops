pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-likhraj') 
        DOCKERHUB_PASSWORD = credentials('dockerhub-Docker@2001')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Pushing build docker image...'
                    bat 'docker push likhraj/mlproject:tagname'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    bat 'python model.py' // Assuming 'model.py' is your test script
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
