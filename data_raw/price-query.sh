#!/usr/bin/env bash

cat aws-instances.json | jq '.[] | select(.instance_type == ("m1.small","m1.medium","m3.medium","m1.large","m3.large","m4.large","c3.large","c4.large","c3.xlarge","c4.xlarge","c1.xlarge")) | {instance_type: .instance_type, "eu-west-1": .pricing."eu-west-1".linux.ondemand, "us-east-1": .pricing."us-east-1".linux.ondemand}'
