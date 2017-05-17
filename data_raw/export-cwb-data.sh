#/usr/bin/env sh

# Current working directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# Variables
CWB_SERVER=cwb.io
SSH_KEY=~/.ssh/cloud-benchmarking.pem

# Upload exporter script to CWB server
scp -qi $SSH_KEY "$SCRIPTPATH/export-cwb-data.rb" ubuntu@$CWB_SERVER:/home/ubuntu/export-cwb-data.rb
# Export CWB data
ssh -i $SSH_KEY ubuntu@$CWB_SERVER 'cd /var/www/cloud-workbench/current && RAILS_ENV=production bin/rails runner /home/ubuntu/export-cwb-data.rb' >"$SCRIPTPATH/cwb-data-raw.csv" 2>"$SCRIPTPATH/cwb-data-raw.log"
