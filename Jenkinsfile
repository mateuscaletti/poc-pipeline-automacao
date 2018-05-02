pipeline {
    agent any

    stages {
		stage('Prepare environment') {
			steps {
				sh 'mkdir $WORKSPACE/results/instance_$BUILD_NUMBER'
				sh 'sh $WORKSPACE/run/defineWorkspaceDir.sh $WORKSPACE'
				sh 'sh $WORKSPACE/run/defineResultDir.sh $WORKSPACE $WORKSPACE/results/instance_$BUILD_NUMBER'
			}
		}
        stage('Soapui Test') {
            steps {
                echo 'Running SoapUI test...'
				sh '/opt/SoapUI-5.4.0/bin/testrunner.sh $WORKSPACE/project/soapui_projects/PocPipeline-soapui-project.xml -a -f$WORKSPACE/results/instance_$BUILD_NUMBER'
            }
        }
        stage('Reporting') {
            steps {
                echo 'Reporting test...'
				sh 'ls $WORKSPACE'
				sh 'ls $WORKSPACE/results/instance_$BUILD_NUMBER'
				sh 'cat $WORKSPACE/results/instance_$BUILD_NUMBER/SuiteCEP-CT_0001_Valida_CEP-HTTP_Chama_WS_CEP-0-OK.txt'
				sh 'tar -czvf $WORKSPACE/results/instance_$BUILD_NUMBER.tar.gz $WORKSPACE/results/instance_$BUILD_NUMBER'
				emailext body: 'teste', subject: 'teste', to: 'mateus@caletti.com.br'
            }
        }
    }
}

