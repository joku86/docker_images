#!/bin/bash
createtopics.sh
waitonport.sh nimbus 6627
sleep 10
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-header-defaulting.properties
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-decoding.properties 
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-defaulting.properties  
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-validating-payload.properties 
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-protobuf-transforming.properties
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-protobuf-encoding.properties
$STORM_HOME/bin/storm jar /etc/pocsp/jobs/deploy_pocsp.stormsp.jar com.bmw.cd.nav.storm.GenericStormJSProcessor pocsp-payload-extraction.properties
runtransmitter.sh 