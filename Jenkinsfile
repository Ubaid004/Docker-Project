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
                    sh 'docker build --tag $img .'
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
                scripts{
                    withCredentials([usernameColonPassword(credentialsId: 'Dockerhubid', variable: 'dockerhub')]) {
                        sh "docker login -u ubaid004 -p $dockerhub"
                        sh "docker push docker push $repo"
                    }
                    
                } 
            }
        }
    }
}
