pipeline {
    agent any

    stages {
		stage('Prepare environment') {
			steps {
				sh 'sed -i "s|\[workspace_dir\]|$WORKSPACE|g" ReportProperties.properties'
			}
		}
        stage('Soapui Test') {
            steps {
                echo 'Running SoapUI test...'
				sh '/opt/SoapUI-5.4.0/bin/testrunner.sh $WORKSPACE/project/soapui_projects/PocPipeline-soapui-project.xml -a -f./results'
            }
        }
        stage('Reporting') {
            steps {
                echo 'Reporting test...'
				sh 'ls $WORKSPACE'
				sh 'cat $WORKSPACE/results/SuiteCEP-CT_0001_Valida_CEP-HTTP_Chama_WS_CEP-0-OK.txt'
            }
        }
    }
}

