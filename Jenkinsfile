pipeline {
    agent any
    stages{
        stage("Pull"){
            steps{
                git url: "https://github.com/Ubaid004/Docker-Project.git", branch: "master"
            }
        }
        stage("Build"){
            steps{
                script{
                    sh 'docker build -t $img .'
                } 
            }
        }
        stage("Tag"){
            steps{
                sh "docker tag $img $repo"
            }
        }
        stage("push"){
            steps{
                script{
                    withCredentials([usernameColonPassword(credentialsId: 'Dockerhubid', variable: 'dockerhub')]) {
                        sh "docker login -u ubaid004 -p $dockerhub"
                        sh "docker push $repo"
                    }
                    
                } 
            }
        }
    }
}



DEPLOYMENT:

pipeline {
    agent any

    stages {
        stage('check') {
            steps {
                git 'https://github.com/Ubaid004/Docker-Project.git'
            }
        }
        stage('stack') {
            steps {
                sh 'docker stack deploy -c docker-compose.yml courses'
            }
        }
    }
}
