#!/bin/bash -x

echo "Iniciando componente 'SOAPUI-POC-PIPELINE'"

# -------------------------------------------------------------------------------------------- #
echo "Inicializando variáveis do projecto..."

WORKSPACE=$1
echo "Variável WORKSPACE = '$WORKSPACE'"

BUILD_NUMBER=$2
echo "Variável BUILD_NUMBER = '$BUILD_NUMBER'"

PROPERTIES_FILE=$WORKSPACE/project/soapui_projects/ReportProperties.properties
echo "Variável PROPERTIES_FILE = '$PROPERTIES_FILE'"

RUN_COMMAND=$WORKSPACE/thirdparty/soapui-5.4.0/bin/testrunner.sh $WORKSPACE/projects/soapui-poc-pipeline/PocPipeline-soapui-project.xml -a -f$WORKSPACE/results/instance_$BUILD_NUMBER
echo "Variável RUN_COMMAND = '$RUN_COMMAND'"

echo "Variáveis de ambiente definidas!"
# -------------------------------------------------------------------------------------------- #


# -------------------------------------------------------------------------------------------- #
echo "Configurando arquivos de propriedades..."

echo "Substituindo a variável 'workspace_dir' com valor '$WORKSPACE' no arquivo '$PROPERTIES_FILE'"
sed -i "s|\[workspace_dir\]|$WORKSPACE|g" $PROPERTIES_FILE

echo "Arquivos de propriedades configurados!"
# -------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------- #
echo "Inicializando o teste..."

sh $RUN_COMMAND

echo "Teste finalizado!"