#!/bin/sh

DIR=`pwd`

mkdir -p .downloads

cd .downloads



if [ ! -f ${DIR}/blobs/berkeleydb/db-5.3.28.tar.gz ];then
    curl -L -O -J http://download.oracle.com/berkeley-db/db-5.3.28.tar.gz
    bosh add-blob --dir=${DIR} db-5.3.28.tar.gz berkeleydb/db-5.3.28.tar.gz
fi

if [ ! -f ${DIR}/blobs/openldap/openldap-2.4.46.tgz ];then
    curl -L -O -J ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.46.tgz
    bosh add-blob --dir=${DIR} openldap-2.4.46.tgz openldap/openldap-2.4.46.tgz
fi

cd -