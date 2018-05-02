#!/bin/bash -x

WORKSPACE=$1
RESULT_DIR=$2

sed -i "s|\[result_dir\]|$RESULT_DIR|g" $WORKSPACE/project/soapui_projects/ReportProperties.properties