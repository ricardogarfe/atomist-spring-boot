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
          sh 'mvn test -DtestFailureIgnore=true'
          junit 'target/surefire-reports/*.xml'
      }
    }
    stage('notify') {
      steps {
        script { 
          resultNotifier.populateGlobalVariables(this)
          def attachments = resultNotifier.generateTestResultAttachment(this)
          resultNotifier.notifySlack("", "jenkins-builds", attachments, "${SLACK_HOOK}")
        }
      }
    }
  }
}
