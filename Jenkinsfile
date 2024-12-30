pipeline {
    agent any

    environment {
        IMAGE_NAME = "jenkins/jenkins:latest"
        CONTAINER_NAME = "jenkins"
        GIT_REPO = "https://github.com/limpixel/kanban-jenskin.git"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone repository dari GitHub
                git branch: 'main', url: "${GIT_REPO}"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    // Stop dan hapus container lama, lalu jalankan yang baru
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p 8080:8080 ${IMAGE_NAME}
                    """
                }
            }
        }
    }
}