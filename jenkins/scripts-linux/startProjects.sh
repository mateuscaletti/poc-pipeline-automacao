#!/bin/bash -x

WORKSPACE=$1
BUILD_NUMBER=$2

echo "Inicializando os projetos..."

for f in $WORKSPACE/projects/* ; do
    SCRIPT_DEFINE="$f/startProject.sh"
	PROJECT_NAME=$(basename $f)
	
    if [ -d ${f} ] && [ -e ${SCRIPT_DEFINE} ]; then
		echo "Projeto '$PROJECT_NAME' inicializando..."
		echo "Criando diretório dos resultados do projeto..."
		mkdir $WORKSPACE/results/instance_$BUILD_NUMBER/$PROJECT_NAME
		echo "Executando o projeto"
		sh $SCRIPT_DEFINE $WORKSPACE $BUILD_NUMBER >> $WORKSPACE/results/instance_$BUILD_NUMBER/$PROJECT_NAME/execution_$PROJECT_NAME.log
		echo "Projeto '$PROJECT_NAME' finalizado!"
    fi
done
