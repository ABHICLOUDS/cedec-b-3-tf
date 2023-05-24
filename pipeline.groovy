pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo 'pull stage update '
            }
        }
        stage('build') { 
            steps {
                echo 'build stage update '
            }
        }
        stage('Deploy') { 
            steps {
                 echo 'deploy stage update '
            }
        }
    }
}