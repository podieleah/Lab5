pipeline {
    agent any

    environment {
        SECRET_VAR = credentials('secret_text') 
        GITHUB_TOKEN = credentials('github-token') 
        DOCKERHUB_CREDENTIALS = credentials('docker')
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/your-username/your-repo.git', credentialsId: 'github-token' 
            }
        }
        stage("Nginx") {
            steps {
                sh 'docker run -d -p 80:80 --name nginx nginx'
                sh "docker exec nginx sh -c 'echo \"hello jenkins! ${SECRET_VAR}\" > /usr/share/nginx/html/index.html'"
            }
        }
        stage("push") {
            steps {
                sh "echo ${DOCKERHUB_CREDENTIALS.password} | docker login -u ${DOCKERHUB_CREDENTIALS.username} --password-stdin"
                sh "docker tag nginx podieleah/mynewnginx:latest"
                sh "docker push podieleah/mynewnginx:latest"
            }
        }
    }
}
