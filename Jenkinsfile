pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    // Construir la aplicación en un contenedor con Node.js
                    docker.build('react-app', '-f Dockerfile .')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Ejecutar pruebas en un contenedor con Node.js
                    docker.image('node:18').inside {
                        sh 'npm install'
                        sh 'npm test -- --watchAll=false'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Desplegar la aplicación con Nginx
                    docker.build('deploy-metricas-job_react-app', '-f Dockerfile .')
                }
            }
        }
    }
    post {
        failure {
            echo 'El pipeline ha fallado.'
        }
    }
}

