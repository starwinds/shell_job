#!/bin/bash
alias_command=$1
path=$2

echo "alias ${alias_command}='cd ${path}'"  >> /root/.bashrc
source /root/.bashrc
