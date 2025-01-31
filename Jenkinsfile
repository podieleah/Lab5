pipeline {
    agent any

    credentials {
        githubToken = credentials('token') 
        dockerHubCreds = credentials('docker') 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:podieleah/Lab5.git', credentialsId: 'Lab5' 
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t podieleah/my-nginx-image .' 
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PWD')]) {
                    sh "echo ${DOCKER_HUB_PWD} | docker login -u ${DOCKER_HUB_USER} --password-stdin"
                    sh 'docker push podieleah/my-nginx-image'
                }
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8080:80 podieleah/my-nginx-image' 
            }
        }
    }
}
