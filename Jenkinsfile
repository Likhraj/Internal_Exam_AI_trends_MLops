pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building...'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Testing...'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker build -t mlproject2 .'
                    sh 'docker tag mlproject2:latest likhraj/mlproject2:latest'
                    sh 'docker push likhraj/mlproject2'
                }
            }
        }
    }
}
