pipeline{
	agent any
	stages{
		steps{
			sh 'docker ps -q | xargs --no-run-if-empty docker stop'
		}


	}
}
