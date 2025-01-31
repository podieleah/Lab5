pipeline {
    agent any

    credentials {
        githubToken = credentials('token') 
        dockerHubCreds = credentials('docker') 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:podieleah/Lab5.git', credentialsId: 'githubToken' 
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t podieleah/my-nginx-image .' 
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "echo ${dockerHubCreds.password} | docker login -u ${dockerHubCreds.username} --password-stdin" 
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
