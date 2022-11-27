//Jenkinsfile (Declarative Pipeline)
/* Requires the Docker Pipeline plugin */
pipeline {
agent {
        docker {
            image 'maven:3.8.4-openjdk-17'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Maven package') {
            steps {
                sh 'echo "Hello, Starting maven package"'
                sh 'mvn clean package'
                sh '''
                    echo "Multiline shell steps works too"
                '''
            }
        }
        stage('Docker build ') {
            steps {
                sh 'echo "Starting docker build steps"'
                sh '''
                    echo "Multiline shell steps works too"
                    docker build -t cicd-demo .
                    docker tag demo tewemit/cicd-demo

                '''
            }
        }
        stage('Push docker image ') {
            steps {
                script {
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd' )])
                sh '''
                    echo "Pushing image"
                    docker login -u tewemit -p ${dockerhubpwd}
                    docker push tewemit/cicd-demo
                    '''
                }

            }
        }
    }
}
