#!/bin/sh

### Parameter

URL="http://ftp.vector.co.jp/56/06/3421/jdbcrunner-1.2.zip"

***

*** Download 

wget ${URL}
unzip jdbcrunner-1.2.zip

*** Package install
sudo yum install -y mysql sysstat dstat 
