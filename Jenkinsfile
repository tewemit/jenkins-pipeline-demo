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
        stage('build') {
            steps {
                sh 'echo "Hello World. Starting build steps"'
                sh 'mvn clean package'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
    }
}
