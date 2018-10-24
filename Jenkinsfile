@Library('slack-notifier') _

pipeline {
  agent any
  tools { 
      maven 'Maven 3.3.9' 
      jdk 'jdk8' 
  }

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
