pipeline {
  agent any
  stages {
    stage('Clean') {
      steps {
        sh 'mvn test'
        library 'slack-notifier'

        populateGlobalVariables(this)
        def attachments = generateTestResultAttachment(this)
        notifySlack(text, channel, attachments, slackHook)
      }
    }
    stage('package') {
      steps {
        sh 'mvn package'
      }
    }
  }
}
