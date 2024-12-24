pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                sh 'git clone https://github.com/limpixel/kanban-jenskin.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins .'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'docker run jenkins npm test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk17
'
            }
        }
    }
}