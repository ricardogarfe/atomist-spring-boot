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
          populateGlobalVariables(this)
          def attachments = generateTestResultAttachment(this)
          notifySlack(text, channel, attachments, "${SLACK_HOOK}")
        }
      }
    }
  }
}
