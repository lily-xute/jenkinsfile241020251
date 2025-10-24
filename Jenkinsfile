pipeline{
    agent any
    stages{
        stage("Clean up with useless jenkins"){
            steps{
                sh 'docker ps -q | xargs --no-run-if-empty docker stop'      
            }
        }
        stage("more useless"){
            steps{
                sh "echo 'goodbye'"
            }
        }
	}
}
