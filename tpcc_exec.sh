#!/bin/bash
##################################################################
#
##################################################################
exec 1> >(tee -a stdout.log)
exec 2> >(tee -a stderr.log >&2)

### Parameter
DBMS="mysql"
INST_DIR="/opt/jdbcrunner-1.2/"
SCRIPT="${INST_DIR}/scripts/tpcc.js"
WH=1
DB="tpcc"
USER="tpcc"
PASS="tpcc"
ENDPOINT="localhost"
CLI="localhost"
CON="1 2 4 8 16 32"
RAMP=300
EXEC=300

### Setting
export CLASSPATH="${CLASSPATH}:${INST_DIR}/jdbcrunner-1.2.jar:${INST_DIR}/lib/mysql-connector-java-5.1.18-bin.jar"

### modify scripts
sed "s/jdbc:${DBMS}:\/\/localhost:/jdbc:mysql:\/\/${ENDPOINT}:/" <  ${SCRIPT} > ${SCRIPT}_${DBMS}

### START TEST
START_TIME=`date +%s`
LOGDIR=${INST_DIR}/logs/${START_TIME}

mkdir -p ${LOGDIR}

echo `date +%Y%m%d_%H%m @${START_TIME}` test start 

for connection in ${CON}
do

echo `date +%Y%m%d_%H%m` connection: ${connection} start

java JR ${INST_DIR}/scripts/tpcc.js -warmupTime ${RAMP} -measurementTime ${EXEC} -nAgents ${connection} -logDir ${LOGDIR}

echo `date +%Y%m%d_%H%m` connection: ${connection} end 

done

END_TIME=`date +%s`

echo `date +%Y%m%d_%H%m @${END_TIME}` test start 

mv stdout.log stderr.log ${LOGDIR}

# ./getMetrics.sh `date @${START_TIME} --iso-8601=seconds` `date @${END_TIME} --iso-8601=seconds`

exit 0
