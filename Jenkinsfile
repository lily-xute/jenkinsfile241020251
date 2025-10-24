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

		stage("Security Scan") {
			steps {
				sh "trivy fs --format json -o trivy-report.json ."
			}
			post {
				always {
					// Archive the Trivy report
					archiveArtifacts artifacts: 'trivy-report.json', onlyIfSuccessful: true
				}
			}
		}

		
		stage('run docker iimage') {
			steps {
				sh 'docker run -d --network publicnetwork --name flask-app myapp'
				sh 'docker run -d -p 80:80 --network publicnetwork --name proxy proxy'
			}
		}
	}
}
