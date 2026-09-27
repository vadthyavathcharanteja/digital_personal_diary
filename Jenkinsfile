pipeline {
    agent any

    environment {
        ANDROID_HOME = "C:\\Users\\CHARAN TEJA\\AppData\\Local\\Android\\Sdk"
        PATH = "C:\\MAD\\flutter\\bin;${env.ANDROID_HOME}\\cmdline-tools\\latest\\bin;${env.ANDROID_HOME}\\platform-tools;${env.PATH}"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                bat 'git config --system --add safe.directory C:/MAD/flutter'
                bat 'flutter pub get'
            }
        }
        stage('Run Tests') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    bat 'flutter test'
                }
            }
        }
        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }
    }
}
