pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Arendlia/express-app-ts.git'
            }
        }
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Docker') {
            steps {
                dockerfile {
                    dir 'src/main/docker'
                    filename 'Dockerfile'
                }
                docker.build("arendlia/jenkins")
            }
        }
        stage('Push') {
            steps {
                script {
                    def version = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                    docker.buildAndPush("arendlia/jenkins:$version")
                }
            }
        }
    }
    post {
        always {
            junit '**/test/reports/*.xml' 
            archiveArtifacts artifacts: 'build', fingerprint: true
        }
    }
}