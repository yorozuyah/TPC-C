#!/bin/sh

### Parameter
DBMS="mysql"
INST_DIR="/opt/jdbcrunner-1.2/"
SCRIPTS="${INST_DIR}/scripts/tpcc_load.js"
WH=100
DB="tpcc"
USER="tpcc"
PASS="tpcc"
ENDPOINT="localhost"

### Setting
export CLASSPATH="${CLASSPATH}:${INST_DIR}/jdbcrunner-1.2.jar:${INST_DIR}/lib/mysql-connector-java-5.1.18-bin.jar"

### modify scripts
sed "s/jdbc:${DBMS}:\/\/localhost:/jdbc:mysql:\/\/${ENDPOINT}:/" <  ${SCRIPTS} > ${SCRIPTS}_${DBMS}

### LOAD
java JR ${SCRIPTS}_${DBMS} -param0 ${WH}

