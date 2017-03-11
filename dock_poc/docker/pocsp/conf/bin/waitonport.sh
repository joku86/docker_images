#!/bin/bash
while ! echo exit | nc $1 $2
do 
sleep 2
echo "waited on port" 
done
