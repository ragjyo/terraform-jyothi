pipeline {
  agent any
  stages {
    stage('INITIALIZING TERRAFORM') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }   
    }
    stage('Terraform validate') {
      steps {
        sh 'terraform validate'
      }   
    }
    stage('Apply terraform') {
      steps {
        sh 'terraform apply -auto-approve'
      }   
    }
    stage('Terraform Destroy') {
      steps {
        sh 'Terraform Destroy'
      }   
    }   
}
}
