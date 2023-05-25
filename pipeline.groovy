pipeline {
    agent {
        node("slave-node")
    } 
    stages {
        stage('Pull') { 
            steps {
                sh 'sudo yum install git -y'
                git branch: 'main', url: 'https://github.com/ABHICLOUDS/student-ui.git'
                sh '''ls
                  pwd'''
            }
        }
        stage('Build') { 
            steps {
            echo 'build stage'
            }
        }
        stage('Deploy') { 
            steps {
                echo 'deplyo stage'
            }
        }
    }
}