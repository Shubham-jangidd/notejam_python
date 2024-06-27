pipeline {
    agent any 
    stages {
        stage('download the lattest code ') { 
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Shubham-jangidd/notejam_python.git']])
            }
        }
        stage('creating the docker image') { 
            steps {
                script{
                    sh 'docker build -t shubhamjangid1/notejam .'
                }
            }
        }
        stage('upload the docker image') { 
            steps {
                script{
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'dockerhub_password', usernameVariable: 'dockerhub_username')]) {
                sh 'docker login -u ${dockerhub_username} -p ${dockerhub_password} '
                }
                sh 'docker push shubhamjangid1/notejam'
}
            }
        }
        stage('deploy the new code on kubernetes') { 
            steps {
                echo "This is Deploy stagee." 
            }
        
    }
}
}