node {
   properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '3')), disableConcurrentBuilds(), [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], pipelineTriggers([pollSCM('H/5 * * * *')])])
   def dockerTag='0.5.7-NEWUI'
   def projectName='cwds/dashboard'
   
   catchError {

   
   stage('Preparation') {
		  git branch: 'master', credentialsId: '433ac100-b3c2-4519-b4d6-207c029a103b', url: 'git@github.com:ca-cwds/dashboard.git'
   }
   stage('Build'){
		echo 'Nothing to do'
   }
	stage ('Build Docker'){
		sh 'docker build -t '+projectName+':'+dockerTag+' .'
		withDockerRegistry([credentialsId: '6ba8d05c-ca13-4818-8329-15d41a089ec0']) {
				sh 'docker push '+projectName+':'+dockerTag
		}
	}
	stage('Clean WorkSpace') {
		sh 'docker rmi '+projectName+':'+dockerTag
		cleanWs()
	}
   } 
    emailext attachLog: true, body: 'For detail see log', recipientProviders: [[$class: 'DevelopersRecipientProvider']], subject: 'Cals-api unstable', to: 'Alex.Kuznetsov@osi.ca.gov'
	cleanWs()
}
