#!/bin/bash -x

WORKSPACE=$1
BUILD_NUMBER=$2

echo "Inicializando os projetos..."

for f in $WORKSPACE/projects/*; do
	echo "Inicializando os projetos..."
	
    SCRIPT_DEFINE=$f/startProject.sh $WORKSPACE $BUILD_NUMBER
	
	
    if [ -d ${f} ] && [ -e ${SCRIPT_DEFINE} ]; then
		echo "Projeto '$SCRIPT_DEFINE' inicializando..."
		sh $SCRIPT_DEFINE
		echo "Projeto '$SCRIPT_DEFINE' finalizado!"
    fi
done
