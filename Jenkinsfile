pipeline {
    agent any

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
                bat 'flutter build apk'
            }
        }
    }
}