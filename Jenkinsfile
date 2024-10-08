pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('your-aws-access-key-id-credential-id')
        AWS_SECRET_ACCESS_KEY = credentials('your-aws-secret-access-key-credential-id')
    }
    stages {
        stage ('git') {
            steps {
                git branch: 'main', url: 'https://github.com/gubbi555/newproject.git'
            }
        }
        stage('deploy') {
            steps {
                withKubeConfig(caCertificate: '', 
                               clusterName: 'arn:aws:eks:ap-south-1:654654360093:cluster/my-cluster', 
                               contextName: 'arn:aws:eks:ap-south-1:654654360093:cluster/my-cluster', 
                               credentialsId: 'k8s',  // replace with the correct kubeconfig credentials
                               namespace: 'default', // or any other namespace you're deploying to
                               restrictKubeConfigAccess: false, 
                               serverUrl: 'https://your-kubernetes-api-server-url') {
                    sh 'kubectl apply -f nginx-deployment.yaml'
                    sh 'kubectl apply -f service-deployment.yaml'
                }
            }
        }
    }
}
