pipeline {
    agent any
    tools{
    // maven is installed in the global tools configuration section with
        maven 'maven_3_8_6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/tewemit/jenkins-pipeline-demo']]])
                sh 'echo "Started maven build stage"'
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'echo "Started docker build stage"'
                    sh 'docker build -t tewemit/cicd-demo .'
                }
            }
        }
        stage('Push image to dockerHub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u tewemit -p ${dockerhubpwd}'

                   }
                   sh 'echo "login successful and started pushing"'
                   sh 'docker push tewemit/cicd-demo'
                }
            }
        }
         stage('Deploy to k8s'){
            steps{
                /* script{
                    kubernetesDeploy (configs: 'deployment.yaml',kubeconfigId: 'k8sconfigpwd')
                }
                // or next one

                stage('Apply Kubernetes files') {
                    withKubeConfig([credentialsId: 'kubuser', serverUrl: 'https://api.k8s.my-company.com']) {
                      sh 'kubectl apply -f deployment.yaml'
                    }
                  }
                   */
                sh 'echo "We will do deployment to k8s next time. Bye"'
            }
        }
    }
}
