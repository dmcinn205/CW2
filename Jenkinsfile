pipeline {
         agent any
         stages {
		 
		 stage('Check GitHub') {
                 steps {
                     git url:'https://github.com/dmcinn205/CW2.git'
                 }	 
                 }
		 
		 stage('Run SonarQube Test') {
		             environment {
        		     scannerhome = tool 'SonarQube'
				 }
				 steps {
					 withSonarQubeEnv('SonarQube') {
					 sh """${scannerhome}/bin/sonar-scanner"""
				 }
					 timeout(time: 10, unit: 'MINUTES') {
                     waitForQualityGate abortPipeline: true
				 }
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
