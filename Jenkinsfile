pipeline {
    agent any

    environment {
        SECRET_VAR = credentials('jenkins-secret') 
            DOCKERHUB_CREDENTIALS = credentials('docker') 
    }
        stages{
            stage("Nginx"){
                steps{
                    sh 'docker run -d -p 80:80 --name nginx nginx'
                    sh "docker exec nginx sh -c 'echo \"hello jenkins! ${SECRET_VAR}\" > /usr/share/nginx/html/index.html
                }
            }
            stage("push"){
                steps{
                    sh "echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    sh "docker tag nginx podieleah/mynewnginx:latest"
                    sh "docker push podieleah/mynewnginx:latest"
                }
            }
        }
}
