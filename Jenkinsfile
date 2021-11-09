pipeline {

    agent any

    stages {
    
        stage('AWS ECR Login') {
            steps {
            sh '''                
            aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/d7a9h0i4
            '''
            }
        }
    }
}
