#!/bin/bash -x

WORKSPACE=$1
RESULTS_DIR=$2

sed -i "s|\[results_dir\]|$RESULTS_DIR|g" $WORKSPACE/project/soapui_projects/ReportProperties.properties