#!/usr/bin/env sh
set -e

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
aggregate=$SCRIPTPATH/aggregate-iterations.rmp
select=$SCRIPTPATH/select.rmp
filter=$SCRIPTPATH/filter.rmp

# Run RapidMiner script in CLI-mode
rapidminer-batch.sh -f $aggregate
rapidminer-batch.sh -f $select
rapidminer-batch.sh -f $filter
