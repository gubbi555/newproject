pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')
    }
    stages {
        stage('cloning git') {
            steps {
                git branch: 'main', url: 'https://github.com/gubbi555/newproject.git'
            }
        }
        stage('maven') {
            steps {
                sh 'mvn package'
            }
        }
        stage('docker build') {
            steps {
                sh "docker build -t tomcat:latest . "
                sh "docker run -t -d -p 8090:8080 --name pk tomcat:latest sh"
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
