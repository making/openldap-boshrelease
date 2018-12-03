#!/bin/sh
set -e

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


DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apr/libapr1_1.5.2-3_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apr-util/libaprutil1_1.5.4-1build1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apr-util/libaprutil1-dbd-sqlite3_1.5.4-1build1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apr-util/libaprutil1-ldap_1.5.4-1build1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/l/lua5.1/liblua5.1-0_5.1.5-8ubuntu1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apache2/apache2-bin_2.4.18-2ubuntu3.8_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apache2/apache2-utils_2.4.18-2ubuntu3.8_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apache2/apache2-data_2.4.18-2ubuntu3.8_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/a/apache2/apache2_2.4.18-2ubuntu3.8_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php-defaults/php-common_35ubuntu6_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-common_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-json_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-opcache_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-readline_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-cli_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/libapache2-mod-php7.0_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php-defaults/libapache2-mod-php_7.0+35ubuntu6_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-ldap_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php-defaults/php-ldap_7.0+35ubuntu6_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/p/php7.0/php7.0-xml_7.0.32-0ubuntu0.16.04.1_amd64.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/universe/p/php-defaults/php-xml_7.0+35ubuntu6_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/main/s/ssl-cert/ssl-cert_1.0.37_all.deb"
DEBS="$DEBS http://kr.archive.ubuntu.com/ubuntu/pool/universe/p/phpldapadmin/phpldapadmin_1.2.2-5.2ubuntu2.1_all.deb"

for deb in $DEBS;do
  f=`echo $deb | python -c 'print raw_input().split("/")[-1]'`
  if [ ! -f ${DIR}/blobs/phpldapadmin/$f ];then
    curl -L -O -J $deb
    bosh add-blob --dir=${DIR} $f phpldapadmin/$f
  fi
  # echo $deb
  # curl -s -I $deb | grep Content-Type
done

cd -
