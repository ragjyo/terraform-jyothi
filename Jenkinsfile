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
    stage('Terraform Destroy') {
      steps {
        sh 'Terraform Destroy'
      }   
    }   
}
}
