#!/bin/sh

# The command line help
display_help() {
    echo "Usage: $0 [-b BASEFOLDER] [-m MAIN] [-l LINTING]"
    echo "   -b, --base-dir      Base directory for source files, defaults to current directory"
    echo "   -o, --output-dir    Output directory for all reporting, defaults to /reports "
    echo
    echo "Compiles and performs basic analysis of the modules/folders specified"
}
cd $PWD
BASE="."

while [ "$1" != "" ]; do
 case $1 in
   -b | --base-dir )       shift
                           BASE=$1
                           ;;
   -o | --output-dir )     shift
                           OUTPUT_DIR=$1
                           ;;
   * )                     echo "$0: Invalid argument $1"
                           display_help
                           exit 1
   esac
   shift
done

CURRENTDIR=$PWD

#Compile all files
mvn clean install

#Create generic artifact
cp target/*.jar target/app.jar

cd $CURRENTDIR
