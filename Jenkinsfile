@Library('slack-notifier') _

pipeline {
  agent any
  tools { 
      maven 'Maven 3.3.9' 
      jdk 'jdk8' 
  }
  environment {
      SLACK_HOOK = credentials('slack-hook')
  }

  stages {
    stage('test') {
      steps {
          sh 'mvn test'
      }
    }
    stage('notify') {
      steps {
        script { 
          ResultNotifier.populateGlobalVariables(this)
          def attachments = ResultNotifier.generateTestResultAttachment(this)
          ResultNotifier.notifySlack(text, channel, attachments, "${SLACK_HOOK}")
        }
      }
    }
  }
}
