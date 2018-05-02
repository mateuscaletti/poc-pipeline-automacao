#!/bin/bash -x

WORKSPACE=$1

sed -i "s|\[workspace_dir\]|$WORKSPACE|g" ReportProperties.properties