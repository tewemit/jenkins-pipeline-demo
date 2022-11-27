pipeline {
    agent any
    tools{
        maven 'maven_3_8_6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/tewemit/jenkins-pipeline-demo']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t tewemit/cicd-demo .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u tewemit -p ${dockerhubpwd}'

}
                   sh 'docker push tewemit/cicd-demo'
                }
            }
        }
        /* stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        } */
    }
}
