#!/bin/bash
createtopics.sh
waitonport.sh yarnrm 8032
sleep 10
find $SAMZA_HOME/conf/ -name "*.properties" | xargs -I{} $SAMZA_HOME/bin/run-job.sh --config-factory=org.apache.samza.config.factories.PropertiesConfigFactory --config-path={}
runtransmitter.sh 