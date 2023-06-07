pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
    }
    stages {
        stage('cloning git') {
            steps {
                git branch: 'main', url: 'https://github.com/gubbi555/newproject.git'
            }
        }
        stage('docker build') {
            steps {
                sh "docker build -t tomcat:latest . "
            }
        }
        stage ('login to dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker tag tomcat:latest prakashmk/tomcat:latest'
                sh 'docker push prakashmk/tomcat:latest'
            }
        }
    }
}
