pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'NodeJSInstallation' // Nama harus sesuai dengan konfigurasi di Jenkins
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }


    stages {
        stage('Checkout Code') {
            steps {
                // Clone repository
                git branch: 'main', url: 'https://github.com/limpixel/kanban-jenskin.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install npm dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh 'npm run build'
            }
        }

        stage('Lint') {
            steps {
                // Run linting checks
                sh 'npm run lint'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy application (e.g., copying files to a server)
                // Modify the deploy command as per your environment
                sh 'scp -r dist/* user@your-server:/var/www/your-project'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
