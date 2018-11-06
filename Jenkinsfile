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
          sh 'printenv'
          sh 'mvn test -Dmaven.test.failure.ignore=true'
      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
          script { 
            resultNotifier.populateGlobalVariables(this)
            def attachments = resultNotifier.generateTestResultAttachment(this)
            (attachments.get(0)).put(thumb_url:"https://raw.githubusercontent.com/hjnilsson/country-flags/master/png100px/ar.png")
            resultNotifier.notifySlack("", "jenkins-builds", attachments, "${SLACK_HOOK}")
            
          }
        }
      }
    }
  }
}
