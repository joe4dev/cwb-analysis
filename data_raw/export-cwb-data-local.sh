#/usr/bin/env sh

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
CWB_REPO_PATH=~/Projects/CloudWorkBench/cloud-workbench

# Remember current working directory
cwd=$(pwd)
# Navigate into CWB repo
cd $CWB_REPO_PATH
# Export CWB data
bin/rails runner "$SCRIPTPATH/export-cwb-data.rb" >"$SCRIPTPATH/cwb-data-raw.csv" 2>"$SCRIPTPATH/cwb-data-raw.log"
# Restore current working directory
cd $cwd
