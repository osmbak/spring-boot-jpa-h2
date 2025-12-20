stages {
  stage('Build') {
    steps {
      sh 'mvn clean package'
    }
  }

  stage('Build Image') {
    steps {
      sh 'docker build -t myapp:1 .'
    }
  }

  stage('Deploy') {
    steps {
      sh 'kubectl rollout restart deployment myapp'
    }
  }
}