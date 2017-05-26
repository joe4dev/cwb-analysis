#!/usr/bin/env sh
set -e

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
select=$SCRIPTPATH/select.rmp
linear_model=$SCRIPTPATH/linear-model.rmp
mappingsFile=$SCRIPTPATH/mappings.csv

# Run RapidMiner script in CLI-mode
rapidminer-batch.sh -f $select
rapidminer-batch.sh -f $linear_model -MmappingsFile=$mappingsFile

# Generate plot
Rscript $SCRIPTPATH/regression.R
