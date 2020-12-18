pipeline {
         agent any
         stages {
		         stage('Run SonarQube Test') {
		             environment {
        		     scannerHome = tool 'SonarQube'
				 }
				 steps {
					 withSonarQubeEnv('sonarqube') {
					 sh "${scannerHome}/bin/sonar-scanner"
				 }
					 timeout(time: 10, unit: 'MINUTES') {
                     waitForQualityGate abortPipeline: true
				 }
				 }
                 }
                 stage('Check GitHub') {
                 steps {
                     echo 'Check GitHub Stage'
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
