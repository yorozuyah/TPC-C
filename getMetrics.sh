#!/bin/sh

NAMESPACE="AWS/RDS"
METRICS="CPUUtilization ReadLatency WriteLatency ReadIOPS WriteIOPS ReadThroughput WriteThroughput ReplicaLag"
DIMMENSIONS="DBInstanceIdentifier=mantanis-mysql"
STATISTICS="Average"
PERIOD="60"
REGION="ap-northeast-1"

START_TIME=`date -d @$1 --iso-8601=seconds` 
END_TIME=`date -d @$2 --iso-8601=seconds` 

for metric in ${METRICS}
do

mon-get-stats \
--namespace "${NAMESPACE}" \
--metric-name "${metric}" \
--dimensions "${DIMMENSIONS}" \
--statistics "${STATISTICS}" \
--start-time "${START_TIME}" \
--end-time "${END_TIME}" \
--period ${PERIOD} \
--region ${REGION} > ${metric}.csv &

done

wait 

exit 0
