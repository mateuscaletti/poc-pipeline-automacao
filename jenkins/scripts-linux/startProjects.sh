#!/bin/bash -x

WORKSPACE=$1
BUILD_NUMBER=$2

for f in $WORKSPACE/projects/*; do
        SCRIPT_DEFINE="$f/startProject.sh"
        if [ -d ${f} ] && [ -e ${SCRIPT_DEFINE} ]; then
                echo $f
        fi
done
