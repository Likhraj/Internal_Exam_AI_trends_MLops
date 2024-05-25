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
                    sh 'docker build -t my_ml_image .'
                    sh 'docker tag mlproject:latest likhraj/mlproject:latest'
                    sh 'docker push likhraj/my_ml_image'
                }
            }
        }
    }
}
