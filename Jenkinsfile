node {
   properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '3')), disableConcurrentBuilds(), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], pipelineTriggers([pollSCM('H/5 * * * *')])])
   def dockerTag='1.0-SNAPSHOT'
   
   catchError {
        cleanWs()

   } 

   
   stage('Preparation') {
		  git branch: 'master', credentialsId: '433ac100-b3c2-4519-b4d6-207c029a103b', url: 'git@github.com:ca-cwds/dashboard.git'

		  
   }
   stage('Build'){
		withDockerServer([]) {
			echo 'Nothing to do'
		}
   }
   stage('SonarQube analysis'){
		withSonarQubeEnv('Core-SonarQube') {
			echo 'Nothing to do'
		}
    }
	stage ('Build Docker'){
		withDockerServer([]) {
			sh('docker build -t '+dockerTag+' .')
			withDockerRegistry([credentialsId: '6ba8d05c-ca13-4818-8329-15d41a089ec0']) {
					sh('docker push '+dockerTag)
			}
	   }
	}
	stage('Clean WorkSpace') {
		cleanWs()
	}
}