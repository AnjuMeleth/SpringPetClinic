pipeline {
    agent {label 'master'}
    tools{maven 'M3'}

    stages {
        stage('Checkout') {
            steps {
                git branch:'main',url:'https://github.com/AnjuMeleth/SpringPetClinic.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn compile'
            }
        }

        stage('test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('package'){
            steps{
                sh 'mvn package'
            }
        }
        stage('deploy'){
            steps{
                sh 'java -jar /var/lib/jenkins/workspace/PetclinicDeclarativepipeline/target/*.jar'
            }
        }


        

    }
}
