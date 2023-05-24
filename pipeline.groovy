pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                git branch: 'main', url: 'https://github.com/ABHICLOUDS/student-ui.git'
                sh '''ls
                  pwd'''
            }
        }
        stage('Build') { 
            steps {
            sh 'mvn clean package'
            }
        }
        stage('Deploy') { 
            steps {
                deploy adapters: [tomcat8(credentialsId: 'tomcat-creds-1', path: '', url: 'http://3.141.3.183:8080/')], contextPath: '/', war: '**/*.war'
            }
        }
    }
}