#!/usr/bin/env bash

apt-get update
apt-get -y install vim autoconf libtool make expat sqlite3 libsqlite3-dev libaprutil1 libaprutil1-dev libapr1 libapr1-dev

SVN_PATH=`which svn`
SVN_PKG="subversion-1.6.23"
INSTALL_DIR="/usr/local/opt"

if [ -z "$SVN_PATH" ]; then
  mkdir -p ${INSTALL_DIR}
  cd ${INSTALL_DIR}

  if [ ! -d "$SVN_PKG" ]; then
    echo "wget http://archive.apache.org/dist/subversion/${SVN_PKG}.tar.gz"
    wget http://archive.apache.org/dist/subversion/${SVN_PKG}.tar.gz
    echo "tar -xvf ${SVN_PKG}.tar.gz" 
    tar -xvf ${SVN_PKG}.tar.gz
  fi

  cd ${SVN_PKG}
  echo "--------CONFIGURE SVN-----------"
  ./configure --with-apr=/usr/bin --with-apr-util=/usr/bin
  echo "----------MAKE SVN--------------"
  make
  echo "---------INSTALL SVN------------"
  make install
fi
