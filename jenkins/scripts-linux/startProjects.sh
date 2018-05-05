#!/bin/bash -x

WORKSPACE=$1
BUILD_NUMBER=$2

echo "Inicializando os projetos..."

for f in $WORKSPACE/projects/* ; do
    SCRIPT_DEFINE="$f/startProject.sh"
	
    if [ -d ${f} ] && [ -e ${SCRIPT_DEFINE} ]; then
		echo "Projeto '$SCRIPT_DEFINE' inicializando..."
		sh $SCRIPT_DEFINE $WORKSPACE $BUILD_NUMBER > $WORKSPACE/results/instance_$BUILD_NUMBER/execution-1.log
		echo "Projeto '$SCRIPT_DEFINE' finalizado!"
    fi
done
