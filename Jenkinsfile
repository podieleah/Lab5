pipeline {
    agent any

    environment {
        SECRET_VAR = credentials('secret_text') 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'Lab5', url: 'git@github.com:podieleah/Lab5.git' 
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t podieleah/my-nginx-image .' 
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u podieleah -p Sumted1215' 
                sh 'docker push podieleah/my-nginx-image' 
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8080:80 podieleah/my-nginx-image' 
            }
        }
    }
}
