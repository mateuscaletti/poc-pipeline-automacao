pipeline {
    agent any

    stages {
        stage('Soapui Test') {
            steps {
                echo 'Running SoapUI test...'
				sh '/opt/SoapUI-5.4.0/bin/testrunner.sh $WORKSPACE/project/soapui_projects/PocPipeline-soapui-project.xml -a -f./results'
            }
        }
        stage('Reporting') {
            steps {
                echo 'Reporting test...'
				sh 'cd $WORKSPACE/results'
				sh 'ls'
            }
        }
    }
}
