pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "deploy-metricas-job_react-app"
        CLOUD_INSTANCE_IP = "104.197.38.90"
        APP_PORT = "3000"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/omar554/Pokeapi.git'
            }
        }
        stage('Build') {
            steps {
                echo "Compilando la aplicación..."
                sh '''
                docker-compose build
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Ejecutando pruebas unitarias..."
                sh '''
                docker run --rm $DOCKER_IMAGE npm test -- --watchAll=false
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo "Desplegando la aplicación..."
                sh '''
                docker-compose down
                docker-compose up -d
                '''
                echo "Aplicación desplegada en http://$CLOUD_INSTANCE_IP:$APP_PORT"
            }
        }
    }
    post {
        success {
            echo "Pipeline completado exitosamente."
        }
        failure {
            echo "El pipeline ha fallado. Revisa los logs para más detalles."
        }
    }
}

