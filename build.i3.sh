#!/bin/bash -ex
docker build -f Dockerfile.i3 -t simlun-rpms-i3 .
mkdir -p output-rpms-i3
docker run --rm -it -v $(pwd)/output-rpms-i3:/root/output-rpms-i3 simlun-rpms-i3 \
    bash -c "cp -av /root/rpmbuild/RPMS/* /root/output-rpms-i3/"
