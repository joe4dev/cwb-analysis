#/usr/bin/env sh

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
CWB_SERVER=cwb.io
SSH_KEY=~/.ssh/cloud-benchmarking.pem

# Create DB dump
ssh -i $SSH_KEY ubuntu@$CWB_SERVER 'pg_dump cloud_workbench_production -U postgres -h localhost' > $SCRIPTPATH/cloud_workbench_production.sql
