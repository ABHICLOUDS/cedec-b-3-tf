pipeline {
    agent any 
    stages {
        stage('pull') { 
            steps {
                echo 'pull stage update github again '
            }
        }
        stage('build') { 
            steps {
                echo 'build stage update github again'
            }
        }
        stage('Deploy') { 
            steps {
                 echo 'deploy stage update github again '
            }
        }
    }
}