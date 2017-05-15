#!/usr/bin/env sh

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
data_raw=$SCRIPTPATH/../data_raw
data_file=cwb-data
data_interim=$SCRIPTPATH/../data_interim
pre_process=$SCRIPTPATH/pre-process.rmp

# Run RapidMiner script in CLI-mode
rapidminer-batch.sh -f $pre_process -MdataRaw=$data_raw -MdataFile=$data_file -MdataInterim=$data_interim
