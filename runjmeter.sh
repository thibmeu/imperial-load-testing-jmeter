#!/bin/bash

TS=`date +%Y%m%d_%H%M%S`

USERS=30
RAMP_TIME=10
RAMP_STEPS=10
HOLD=10
DELAY=0
LAMBDA=0
JMETER_LOG=jmeter-${TS}.log
RESULTS=jmeter-${TS}.csv
URL=http://0.0.0.0:8080/jpetstore #replace 0.0.0.0 with your IP. Remove :8080 for PaaS instances.


java -XX:+PreserveFramePointer -jar ./apache-jmeter-3.1/bin/ApacheJMeter.jar -p jmeter.properties -n -t jpetstore-load-test.jmx \
-l $RESULTS -j $JMETER_LOG \
-Jurl=$URL \
-Jusers=$USERS \
-Jramp_time=$RAMP_TIME \
-Jramp_steps=$RAMP_STEPS \
-Jhold=$HOLD \
-Jdelay=$DELAY \
-Jlambda=$LAMBDA
