pipeline {
    agent {
        label 'slave'
    }

    options {
        timeout(time: 1, unit: 'HOURS')
        timestamps()
    }

    stages {
        stage('check-gh-trust') {
            steps {
                checkGitHubAccess()
            }
        }

        stage('test-build') {
            when {
                not {
                    branch 'master'
                }
            }
            steps {
                sh 'make build'
            }
        }

        stage('deploy-to-gh-pages') {
            when {
                branch 'master'
            }
            agent {
                label 'deploy'
            }
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'jenkins-static-deploy-key',
                    keyFileVariable: 'SSHKEY_LOCATION')
                ]) {
                    sh 'GIT_SSH_COMMAND="ssh -i \"$(SSHKEY_LOCATION)\"" make really_deploy'
                }
            }
        }
    }
}
