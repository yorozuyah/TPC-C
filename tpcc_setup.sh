#!/bin/sh

### Parameter

INST_DIR="/opt"
URL="http://ftp.vector.co.jp/56/06/3421/jdbcrunner-1.2.zip"

***

*** Download 

cd ${INST_DIR}
wget ${URL}
unzip jdbcrunner-1.2.zip

*** Package install
sudo yum install -y mysql sysstat dstat 
