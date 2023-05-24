pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo 'pull stage'
            }
        }
        stage('build') { 
            steps {
                echo 'build stage'
            }
        }
        stage('Deploy') { 
            steps {
                 echo 'deploy stage'
            }
        }
    }
}