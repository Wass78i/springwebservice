pipeline {
    agent any
    environment {
        PATH = "/usr/lib/jvm/jdk-19/bin:$PATH"
        JAVA_HOME="/usr/lib/jvm/jdk-19/"
        registry = "gamankhnouf/repo"
        registryCredential = 'jenkinsdockerhub'
        dockerImage = ''
    }

        stages {
            stage('recuperation du projet'){
                steps {
                    git branch: 'master',
                    credentialsId: 'jenkinsgithub',
                    url :'git@github.com:Wass78i/springwebservice.git'
                }
            }
            stage("Compile") {
                steps {
                    sh "chmod +x gradlew"
                    sh "./gradlew compileJava"
                }
            }
            stage("Test") {
                steps {
                    sh "./gradlew test"
                }
            }
            stage("Package") {
                steps {
                    sh "./gradlew build"
                }
            }
            stage("Docker build") {
                steps{
                    script {
                        sh "docker build -t 172.17.0.3:5000/imagespring ."
                    }
                }
            }

            stage("Docker push") {
                steps{
                    script {
                        sh "docker push 172.17.0.3:5000/imagespring"
                    }
                }
            }

        }
}