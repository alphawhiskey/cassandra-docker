#!/bin/sh
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERSION="3.11.4"
SHA256="5d598e23c3ffc4db0301ec2b313061e3208fae0f9763d4b47888237dd9069987"
TARBALL="apache-cassandra-${VERSION}-bin.tar.gz"
URL="http://apache.mirror.anlx.net/cassandra/${VERSION}/${TARBALL}"

cd /

set -e
set -x

# download the tarball from an Apache mirror
# verify the checksum
# untar in /opt, cleanup, symlink to /opt/cassandra

echo "${SHA256} ${TARBALL}" > ${TARBALL}.sha256

# copy in from the Dockerfile for now to save downloads
#curl -O -s ${URL}

sha256sum --check ${TARBALL}.sha256

tar -xzf ${TARBALL} -C /opt

rm -f ${TARBALL} ${TARBALL}.sha256

ln -s /opt/apache-cassandra-$VERSION /opt/cassandra

rm -f $0
