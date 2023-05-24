pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo 'pull stage update github '
            }
        }
        stage('build') { 
            steps {
                echo 'build stage update github '
            }
        }
        stage('Deploy') { 
            steps {
                 echo 'deploy stage update github '
            }
        }
    }
}