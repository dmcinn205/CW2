pipeline {
         agent any
         stages {
                 
				 
				 
		 stage('Check GitHub Repo') {
                 steps {
                     git url: 'https://github.com/dmcinn205/CW2.git'
                 }
                 }

	         stage('SonarQube Analysis') {
                 def scannerHome = tool 'SonarQube';
                    withSonarQubeEnv('SonarQube') { 
                    sh "${scannerHome}/bin/sonar-scanner"
                 }
                 }
		 
                 stage('Build Docker Image') {
                 steps {
                    sh """ ssh ubuntu@100.25.46.184 "cd CW2; docker image build --tag dmcinn205/cw2:$BUILD_NUMBER ." """
                 }
                 }
		 
                 stage('Push Docker Image') {
                 steps {
                    sh """ ssh ubuntu@100.25.46.184 "cd CW2; docker image push dmcinn205/cw2:$BUILD_NUMBER" """
                 }
                 }

		 stage('Deploy to Kubernetes') {
                 steps {
                    sh """ ssh ubuntu@100.25.46.184 "cd CW2; kubectl set image deployments/kubernetes-cw2 cw2=dmcinn205/cw2:latest" """
                 }
                 }
		 
              }
}
