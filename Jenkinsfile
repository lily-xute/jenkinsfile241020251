pipeline{
	agent any
	stages{

		stage('JENKINS USELESS Show Workspace') {
			steps {
				echo "Workspace: ${env.WORKSPACE}"
				sh 'ls -la'
			}
		}
		
		stage("Clean up with useless jenkins"){
			steps{
				sh 'docker ps -q | xargs --no-run-if-empty docker stop'
				sh 'docker ps -aq | xargs --no-run-if-empty docker rm -f'
				sh 'docker images -q | xargs --no-run-if-empty docker rmi -f'
				sh 'docker ps -aq | xargs --no-run-if-empty docker rm -f'
				sh 'docker images -q | xargs --no-run-if-empty docker rmi -f'
				sh 'docker network ls --filter type=custom -q | xargs --no-run-if-empty docker network rm'
			}
		}
		stage('create networks') {
			steps {
				sh 'docker network create publicnetwork'
			}
		}
		stage('Buggy Build Docker Image') {
			steps {
				sh 'docker build -t myapp:latest .'
				sh 'docker build -f Dockerfile.nginx -t proxy .'
			}
		}
		stage('run docker iimage') {
			steps {
				sh 'docker run -d -p 5500:5500 --name myapp myapp'
			}
		}
	}
}
