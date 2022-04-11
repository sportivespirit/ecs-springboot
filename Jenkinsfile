pipeline {
    agent any
    stages {
        stage('Build App') {
            steps {
                echo 'Running Build Automation'
                sh 'mvn clean install -DskipTests=true'
                archiveArtifacts artifacts: 'target/springboot-practice-0.0.1-SNAPSHOT.jar'
            }
        }
        stage('DeployToStaging') {
            when {
                branch 'master'
            }
            steps {
                withCredentials(usernamePassword(credentialsId:'webserver_login', usernameVariable: 'USERNAME',passwordVariable: 'USERPASS') {
                    sshPublisher{
                        failOnError: true,
                        continueOnError: false,
                        publishers: {
                            sshPublishDesc(
                                configure: 'staging'
                                sshCredentials: [
                                    username: '$USERNAME',
                                    encryptedPassphrase: '$USERPASS'
                                ],
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'target/springboot-practice-0.0.1-SNAPSHOT.jar',
                                        removePrefix: 'target/',
                                        remoteDirectory: '/tmp',
                                        execCommand: 'java -jar  springboot-practice-0.0.1-SNAPSHOT.jar'
                                    )
                                ]
                            )
                        }
                    }
                }
            }
        }
    }
}