pipeline{
	agent any
	stages{
		stage("Clean up with useless jenkins"){
			steps{
				sh 'docker ps -q | xargs --no-run-if-empty docker stop'
				sh 'docker ps -aq | xargs --no-run-if-empty docker rm -f'
				sh 'docker images -q | xargs --no-run-if-empty docker rmi -f'
				sh 'docker ps -aq | xargs --no-run-if-empty docker rm -f'
				sh 'docker images -q | xargs --no-run-if-empty docker rmi -f'
			}
		}
		stage('Build Docker Image') {
			steps {
				sh 'docker build -t myapp:latest .'
			}
		}
		stage('Show Workspace') {
			steps {
				echo "Workspace: ${env.WORKSPACE}"
				sh 'ls -la'
			}
		}
	}
}
