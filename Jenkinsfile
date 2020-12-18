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
                    sh"""ssh ubuntu@100.25.46.184 "cd CW2; docker image build --tag dmcinn205/CW2:$BUILD_NUMBER .""""
                 }
                 }
		 
                 stage('Push Docker Image') {
                 steps {
                    sh"""ssh ubuntu@100.25.46.184 "cd CW2; docker image push --tag dmcinn205/CW2:$BUILD_NUMBER .""""
                 }
                 }
						   
                 stage('Deploy To Kubernetes') {
                 steps {
                     sh"""ssh ubuntu@100.25.46.184 "cd CW2; kubectl set image deployment/kubernetes-cw2 kubernetes-cw2=dmcinn205/cw2:latest"""
                 }
                 }
              }
}
