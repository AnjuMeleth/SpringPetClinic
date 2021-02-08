node{
    stage('Checkout'){
        git branch: 'main', url:'https://github.com/AnjuMeleth/SpringPetClinic.git'
    }
    stage('Build'){
        withMaven(maven: 'M3'){
            sh 'mvn compile'
        }
    }
}
