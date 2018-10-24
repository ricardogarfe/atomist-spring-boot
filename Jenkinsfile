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
    steps {
        sh 'printenv'
    }

    stage('test') {
      steps {
          sh 'mvn test -Dmaven.test.failure.ignore=true'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
          script { 
            resultNotifier.populateGlobalVariables(this)
            def attachments = resultNotifier.generateTestResultAttachment(this)
            resultNotifier.notifySlack("", "jenkins-builds", attachments, "${SLACK_HOOK}")
          }
        }
      }
    }
  }
}
