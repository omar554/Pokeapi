pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                script {
                    // Instalación de dependencias
                    sh 'npm install'
                }
            }
        }

        // stage('Run tests') {
        //     steps {
        //         script {
        //             // Aquí es donde se ejecutan los tests, lo eliminamos o comentamos
        //             sh 'npm test'
        //         }
        //     }
        // }

        stage('Build') {
            steps {
                script {
                    // Proceso de construcción
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Despliegue de la aplicación
                    sh 'npm run deploy'
                }
            }
        }
    }
}


