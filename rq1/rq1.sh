#!/usr/bin/env sh
set -e

# RapidMiner script
RMP_BIN="/Applications/RapidMiner Studio.app/Contents/Resources/RapidMiner-Studio/scripts/rapidminer-batch-osx.sh"

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
aggregate=$SCRIPTPATH/aggregate-iterations.rmp
select=$SCRIPTPATH/select.rmp
filter=$SCRIPTPATH/filter.rmp
outFile=$SCRIPTPATH/cwb-interim-aggregated-selected-filtered.csv

# Run RapidMiner script in CLI-mode
"$RMP_BIN" -f $aggregate
"$RMP_BIN" -f $select
"$RMP_BIN" -f $filter -MoutFile=$outFile

# Generate plot
Rscript $SCRIPTPATH/rsd-plots.R
