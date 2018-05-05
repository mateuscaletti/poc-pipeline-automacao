#!/bin/bash -x

WORKSPACE=$1

sed -i "s|\[workspace_dir\]|$WORKSPACE|g" $WORKSPACE/project/soapui_projects/ReportProperties.properties