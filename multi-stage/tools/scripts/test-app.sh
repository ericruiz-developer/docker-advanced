#!/bin/sh

# The command line help
display_help() {
    echo "Usage: $0 -m MAINMODULE"
    echo
}

cd $PWD
BASE_DIR="."
DEFAULT_OUTPUT_DIR="${BASE_DIR}/target"
TARGET_OUTPUT_DIR="${BASE_DIR}/reports"
OUTPUT_DIR=""

while [ "$1" != "" ]; do
 case $1 in
   * )                     echo "$0: Invalid argument $1"
                           display_help
                           exit 1
   esac
   shift
done

#######################
# Lint checkstyle
# Uses Apache Maven Checkstyle Plugin https://maven.apache.org/plugins/maven-checkstyle-plugin/index.html
# Output defaults to ${basedir}/target/
#######################
mvn checkstyle:checkstyle

#######################
# Execute Tests
# Uses Apache Maven Checkstyle Plugin https://maven.apache.org/plugins/maven-checkstyle-plugin/index.html
# Output defaults to ${basedir}/target/surefire-reports
#######################
mvn test

# Move all output to /reports for circleci artifact creation
mkdir -p ${TARGET_OUTPUT_DIR}/lint/html
mkdir -p ${TARGET_OUTPUT_DIR}/test_reports

cp -r ${DEFAULT_OUTPUT_DIR}/site/. ${TARGET_OUTPUT_DIR}/lint/html
cp ${DEFAULT_OUTPUT_DIR}/checkstyle* ${TARGET_OUTPUT_DIR}/lint/
cp -r ${DEFAULT_OUTPUT_DIR}/surefire-reports/. ${TARGET_OUTPUT_DIR}/test_reports/
