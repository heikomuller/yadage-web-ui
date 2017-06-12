#!/bin/sh
cd /tmp
mkdir yadage
cd yadage
virtualenv venv
source venv/bin/activate
git clone https://github.com/heikomuller/yadage-workflow-repository.git
git clone https://github.com/heikomuller/yadage-engine-api.git
pip install yadage-workflow-repository/
pip install yadage-engine-api/
export YADAGEWFREPO_CONFIG=/tmp/yadage/yadage-workflow-repository/config/config.yaml
export YADAGE_ENGINE_CONFIG=/tmp/yadage/yadage-engine-api/config/config.yaml
redis-server&
celery worker -A packtivity.asyncbackends:default_celeryapp -I packtivity.asyncbackends -l debug&
python yadage-workflow-repository/yadagetemplates/&
python yadage-engine-api/yadageengine/&
