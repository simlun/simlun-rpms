#!/bin/bash -ex

# Usage:
# $ ./upload.sh output-rpms/x86_64/xclip-0.13-8.el8.x86_64.rpm

RPM_FILE="$1"

RPM_NAME=`rpm --queryformat "%{NAME}" -qp $RPM_FILE`
RPM_VERSION=`rpm --queryformat "%{VERSION}" -qp $RPM_FILE`
RPM_RELEASE=`rpm --queryformat "%{RELEASE}" -qp $RPM_FILE`
RPM_ARCH=`rpm --queryformat "%{ARCH}" -qp $RPM_FILE`
VERSION_NAME="$RPM_VERSION-$RPM_RELEASE.$RPM_ARCH"

FILE_TARGET_PATH=$(basename $RPM_FILE)

echo API_KEY:
read -s API_KEY

curl -v -T "$RPM_FILE" -usimlun:"$API_KEY" "https://api.bintray.com/content/simlun/centos-8/$RPM_NAME/$VERSION_NAME/$FILE_TARGET_PATH"
