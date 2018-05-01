#!/bin/bash -x

#
#   Regression Test Script for performing regression testing
#   
#   Note: Caution should be exercised where more than one set
#   of test suites exist in the same soapui project
#
#   Script invokes SOAPUI testrunner to perform tests
#
#   Script arguments:
#       target host
#

if [ $# -ne 1 ];
then
    echo "Usage: $0 target_host"
    exit 1
fi
TargetHost=$1
curdir=`pwd`
ProjectFile=$curdir/testing/SoapUI/YourProject.xml
SOAPUI_HOME=/soapuipath/soapui
TEST_RUNNER=testrunner.sh

if [ ! -f "$ProjectFile" ];
then
    echo "Project File does not exist"
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
bash -x ./$TEST_RUNNER -s"TestSuite 1" -c"TestCase 1 - Sanity Tests" -ehttps://$TargetHost:port/testurl "$ProjectFile"
check_status $? "Failed to pass regression testing "

cd "$curdir"