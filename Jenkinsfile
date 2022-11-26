//Jenkinsfile (Declarative Pipeline)
/* Requires the Docker Pipeline plugin */
pipeline {
    //agent { docker { image 'maven:3.8.6-openjdk-11-slim' } }
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
