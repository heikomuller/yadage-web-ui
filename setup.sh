#!/bin/sh

# Ensure that directory parameter is given
if [ "$1" = "" ]; then
    echo "Missing argument for install directory"
    echo "Usage:" $0 "<install-dir>"
    exit 1
fi
if [ ! -d $1 ]
then
    echo "Create directory" $1
    mkdir -p $1
fi

cd $1
virtualenv venv
source venv/bin/activate
git clone https://github.com/heikomuller/yadage-workflow-repository.git
git clone https://github.com/heikomuller/yadage-engine-api.git
venv/bin/pip install yadage-workflow-repository/
venv/bin/pip install yadage-engine-api/
