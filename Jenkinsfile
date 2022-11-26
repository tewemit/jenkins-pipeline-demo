//Jenkinsfile (Declarative Pipeline)
/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'adoptopenjdk/maven-openjdk11' } }
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
