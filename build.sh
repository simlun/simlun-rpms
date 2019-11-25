#!/bin/bash -ex
docker build -t simlun-rpms .
mkdir -p output-rpms
docker run --rm -it -v $(pwd)/output-rpms:/root/output-rpms simlun-rpms \
    bash -c "cp -av /root/rpmbuild/RPMS/* /root/output-rpms/"
