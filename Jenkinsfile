pipeline {
    agent any

    environment {
        PATH = "C:\\MAD\\flutter\\bin;${env.PATH}"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                bat 'flutter pub get'
            }
        }
        stage('Run Tests') {
            steps {
                bat 'flutter test'
            }
        }
        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }
    }
}
