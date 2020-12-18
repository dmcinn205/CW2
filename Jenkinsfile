pipeline {
         agent any
         stages {
                 stage('Check GitHub') {
                 steps {
                     echo 'Check GitHub Stage'
                 }
                 }
                 stage('Run SonarQube Test') {
                 steps {
                    echo 'Run SonarQube Test'
                 }
                 }
                 stage('Build Docker Image') {
                 steps {
                    echo 'Build Docker Image'
                 }
                 }
                 stage('Push Docker Image') {
                 steps {
                    echo 'Push Docker Image'
                 }
                 }
						   
                 stage('Deploy To Kubernetes') {
                 steps {
                     echo 'Deploy To Kubernetes'
                 }
                 }
              }
}
