#!/bin/bash -x

WORKSPACE=$1
BUILD_NUMBER=$2
STAGE_NAME=$3

echo "Inicializando os projetos do $STAGE_NAME..."

for f in $WORKSPACE/projects/$STAGE_NAME/* ; do
    SCRIPT_DEFINE="$f/startProject.sh"
	PROJECT_NAME=$(basename $f)
	
	echo "Verificando se arquivo $SCRIPT_DEFINE existe..."
    if [ -d ${f} ] && [ -e ${SCRIPT_DEFINE} ]; then
		RESULT_DIR=$WORKSPACE/results/instance_$BUILD_NUMBER/$STAGE_NAME/$PROJECT_NAME
		LOG_EXECUTION_NAME=$RESULT_DIR/execution_${STAGE_NAME}_${PROJECT_NAME}.log
	
		echo "Projeto '$PROJECT_NAME' inicializando..."
		echo "Criando diretório dos resultados do projeto em '$RESULT_DIR'..."
		mkdir $RESULT_DIR
		echo "Executando o projeto com log em '$LOG_EXECUTION_NAME'"
		sh $SCRIPT_DEFINE $WORKSPACE $BUILD_NUMBER >> $LOG_EXECUTION_NAME
		echo "Projeto '$PROJECT_NAME' finalizado!"
    fi
done
