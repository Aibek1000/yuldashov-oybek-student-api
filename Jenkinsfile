pipeline {
    agent any

    environment {
        IMAGE = 'yuldashov-oybek-student-api:v1.0-yuldashov-oybek'
        STUDENT = 'Oybek Yuldashov (IT2-23)'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT}"
            }
        }
        stage('Build') {
            steps {
                echo "Building project - ${STUDENT}"
                sh '''
                    if [ -f gradlew ]; then
                        chmod +x gradlew && ./gradlew clean build -x test --no-daemon
                    else
                        gradle clean build -x test --no-daemon
                    fi
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    if [ -f gradlew ]; then ./gradlew test --no-daemon; else gradle test --no-daemon; fi
                '''
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE} .'
            }
        }
        stage('Verify') {
            steps {
                sh '''
                    docker image inspect ${IMAGE} > /dev/null
                    echo "VERIFIED: image ${IMAGE} exists - ${STUDENT}"
                    docker images ${IMAGE%%:*}
                '''
            }
        }
    }

    post {
        success { echo "Pipeline SUCCESS - ${STUDENT}" }
        failure { echo "Pipeline FAILED - ${STUDENT}" }
    }
}
