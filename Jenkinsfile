pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:podieleah/Lab5.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t my-nginx-image .' 
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 8080:80 my-nginx-image' 
            }
        }
    }
}
