#!/bin/bash -x

echo "Iniciando componente 'SOAPUI-POC-PIPELINE'"

# -------------------------------------------------------------------------------------------- #
echo "Inicializando variáveis do projecto..."

PROJECT_NAME="soapui-poc-pipeline"

WORKSPACE=$1
echo "Variável WORKSPACE = '$WORKSPACE'"

BUILD_NUMBER=$2
echo "Variável BUILD_NUMBER = '$BUILD_NUMBER'"

PROPERTIES_FILE=$WORKSPACE/project/$PROJECT_NAME/ReportProperties.properties
echo "Variável PROPERTIES_FILE = '$PROPERTIES_FILE'"

RESULTS_DIR=$WORKSPACE/results/instance_$BUILD_NUMBER/$PROJECT_NAME
echo "Variável RESULTS_DIR = '$RESULTS_DIR'"

RUN_COMMAND="$WORKSPACE/thirdparty/soapui-5.4.0/bin/testrunner.sh $WORKSPACE/projects/$PROJECT_NAME/PocPipeline-soapui-project.xml -a -f$WORKSPACE/results/instance_$BUILD_NUMBER/$PROJECT_NAME"
echo "Variável RUN_COMMAND = '$RUN_COMMAND'"

echo "Variáveis de ambiente definidas!"
# -------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------- #
echo "Configurando arquivos de propriedades..."

echo "Criando diretório de logs"
mkdir $RESULTS_DIR

echo "Substituindo a variável 'workspace_dir' com valor '$WORKSPACE' no arquivo '$PROPERTIES_FILE'"
sed -i "s|\[workspace_dir\]|$WORKSPACE|g" $PROPERTIES_FILE

echo "Substituindo a variável 'results_dir' com valor '$RESULTS_DIR' no arquivo '$PROPERTIES_FILE'"
sed -i "s|\[results_dir\]|$RESULTS_DIR|g" $PROPERTIES_FILE

echo "Arquivos de propriedades configurados!"
# -------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------- #
echo "Inicializando o teste..."

sh $RUN_COMMAND

echo "Teste finalizado!"