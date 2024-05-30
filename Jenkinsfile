pipeline {
    
    agent any
    
    environment {
        // Define environment variables
        TF_VAR_FILE = "Terraform/terraform.tfvars"
        ANSIBLE_INVENTORY_FILE = "Ansible/inventory.ini"
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_SESSION_TOKEN = credentials('AWS_SESSION_TOKEN')
        AWS_SSH_KEY = credentials('AWS_SSH_KEY')
    }

    stages {
        stage('Initialize Terraform') {
            when {
                expression { params.init == 'yes' }
            }
            steps {
                sh '''
                    cd Terraform
                    terraform init -no-color
                '''
            }
        }
        stage('Plan the Terraform run') {
            when {
                expression { params.action == 'plan' }
            }
            steps {
                sh '''
                    cd Terraform
                    terraform plan -out=tfplan -no-color
                '''
            }
        }

        stage('Approve') {
            when {
                expression { params.action == 'apply' }
            }
            steps {
                // Wait for manual approval
                input message: 'Do you want to Build the Instance?', ok: 'Approve'
            }
        }

        stage('Apply the Terraform plan') {
            steps {
                sh '''
                    cd Terraform
                    terraform apply "tfplan" -no-color
                '''
            }
        }

        stage('Update Ansible Inventory') {
            steps {
                script {
                    def publicIp = sh(script: "terraform output instance_public_ip", returnStdout: true).trim()
                    writeFile(file: ANSIBLE_INVENTORY_FILE, text: "[Project1]\n${publicIp}")
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: PRIVATE_KEY_CREDENTIALS_ID, keyFileVariable: 'SSH_KEY_PATH')]) {
                    ansiblePlaybook playbook: 'Ansible/Deploy_docker.yml',
                                    inventory: AWS_SSH_KEY,
                                    extras: "--private-key=${SSH_KEY_PATH}"
                }
            }
        }
        
    }
}
