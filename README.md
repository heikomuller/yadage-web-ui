# Yadage Web User-Interface

This repository contains a basic Web User-Interface for Yadage. The Web UI is a set of static files.


## Setup

The Web UI uses the [Yadage Template API]('https://github.com/heikomuller/yadage-workflow-repository') and the [Yadage Engine API]('https://github.com/heikomuller/yadage-engine-api'). Below is a simple script (```simple_run.sh```) that runs both services (assumes that Python virtual environment, Mongo DB, and Redis are installed locally):

```
cd /tmp
mkdir yadage
cd yadage
virtualenv venv
source venv/bin/activate
git clone https://github.com/heikomuller/yadage-workflow-repository.git
git clone https://github.com/heikomuller/yadage-engine-api.git
git clone https://github.com/heikomuller/yadage-web-ui.git
pip install yadage-workflow-repository/
pip install yadage-engine-api/
export YADAGEWFREPO_CONFIG=/tmp/yadage/yadage-workflow-repository/config/config.yaml
export YADAGE_ENGINE_CONFIG=/tmp/yadage/yadage-engine-api/config/config.yaml
redis-server&
celery worker -A packtivity.asyncbackends:default_celeryapp -I packtivity.asyncbackends -l debug&
python yadage-workflow-repository/yadagetemplates/&
python yadage-engine-api/yadageengine/&
```


## Run

Open the file ```index.html``` in a browser.  After running the above script, the file ```index.html``` is located in directory ```/tmp/yadage/yadage-web-ui/static```.
