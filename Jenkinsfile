pipeline {
    
    agent any
    
    environment {
        // Define environment variables
        TF_VAR_FILE = "Terraform/terraform.tfvars"
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
    }

    stages {
        stage('Initialize Terraform') {
            sh '''
                cd Terraform
                terraform init
            '''
        }
        stage('Plan the Terraform run') {
            sh '''
                cd Terraform
                terraform plan
            '''
        }
        stage('Apply the Terraform plan') {
            sh '''
                cd Terraform
                terraform apply
            '''
        }
    }
}