#!/bin/bash
 
/usr/local/hadoop/sbin/yarn-daemon.sh start resourcemanager 
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver


echo "ResourceManager done"
