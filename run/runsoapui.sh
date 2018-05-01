#!/bin/bash -x

#
#   Based on https://stackoverflow.com/questions/6648244/how-to-integrate-soapui-with-jenkins
#

if [ $# -ne 1 ];
then
    echo "Usage: $0 project file name"
    exit 1
fi

curdir=`pwd`
SoapuiProjectBase=$curdir/../project/soapui_projects/
SOAPUI_HOME=/opt/SoapUI-5.4.0
TEST_RUNNER=testrunner.sh

ProjectFile=$SoapuiProjectBase/$1

if [ ! -f "$ProjectFile" ];
then
    echo "Project File ($ProjectFile) does not exist"
    exit 1
fi
###############################################################################################
## Check the status of the last shell operation and if failed exit
###############################################################################################

## --------------------------------------------------------------------------------
##  Return the operating system pathname for the datafiles for the specified database
##
##  Arguments:
##      The return value to check.  zero indicates all is good.  Non-zero indicates error
##      The error message to display when exiting
##      
##  Exits if error detected
check_status()
{
    if [ $# -ne 2 ];
    then
        echo "$0: Programming error: Report to sysadmin@yourdomain.com"
        exit -1
    fi
    exit_code=$1
    err_msg=$2
    if [ $exit_code -ne 0 ];
    then
        echo $err_msg
        exit $exit_code
    fi
}


cd $SOAPUI_HOME/bin
bash -x ./$TEST_RUNNER "$ProjectFile"
#check_status $? "Failed to pass regression testing "

cd "$curdir"