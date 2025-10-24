pipeline{
	agent any
	stages{
		stage{
			steps{
				sh 'docker ps -q | xargs --no-run-if-empty docker stop'
			}
		}

	}
}
