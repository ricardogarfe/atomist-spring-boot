pipeline {
  agent any
  stages {
    stage('Clean') {
      steps {
        parallel(
          "Clean": {
            sh 'mvn clean'
            
          },
          "Test": {
            sh 'mvn test'
            
          }
        )
      }
    }
    stage('package') {
      steps {
        sh 'mvn package'
      }
    }
  }
}