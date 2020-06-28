#!/usr/bin/env sh
set -e

# RapidMiner script
RMP_BIN="/Applications/RapidMiner Studio.app/Contents/Resources/RapidMiner-Studio/scripts/rapidminer-batch-osx.sh"

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
select=$SCRIPTPATH/select.rmp
linear_model=$SCRIPTPATH/linear-model.rmp
mappingsFile=$SCRIPTPATH/mappings.csv

# Run RapidMiner script in CLI-mode
$RMP_BIN -f $select
$RMP_BIN -f $linear_model -MmappingsFile=$mappingsFile

# Generate plot
Rscript $SCRIPTPATH/wpbench-regression.R
Rscript $SCRIPTPATH/wpbench-iterations.R
