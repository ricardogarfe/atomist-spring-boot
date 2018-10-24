@Library('slack-notifier') _

pipeline {
  agent any
  stages {
    stage('Clean') {
      steps {
        script { 
          sh 'mvn test'
          populateGlobalVariables(this)
          def attachments = generateTestResultAttachment(this)
          notifySlack(text, channel, attachments, slackHook)
        }
      }
    }
    stage('package') {
      steps {
        sh 'mvn package'
      }
    }
  }
}
