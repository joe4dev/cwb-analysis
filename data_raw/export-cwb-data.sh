#!/usr/bin/env sh
cd /var/www/cloud-workbench/current && RAILS_ENV=production bin/rails runner /home/ubuntu/cwb_exporter.rb
