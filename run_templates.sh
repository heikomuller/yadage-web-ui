#!/bin/sh

# Ensure that directory parameter is given
if [ "$1" = "" ]; then
    echo "Missing argument"
    echo "Usage:" $0 "<install-dir>"
    exit 1
fi
if [ ! -d $1 ]
then
    echo "Directory" $1 "does not exist."
    exit 1
fi

cd $1
export YADAGEWFREPO_CONFIG=$1/yadage-workflow-repository/config/config.yaml
venv/bin/python yadage-workflow-repository/yadagetemplates/
