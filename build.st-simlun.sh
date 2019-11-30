#!/bin/bash -ex
docker build -f Dockerfile.st-simlun -t simlun-rpms-st-simlun .
mkdir -p output-rpms-st-simlun
docker run --rm -it -v $(pwd)/output-rpms-st-simlun:/root/output-rpms-st-simlun simlun-rpms-st-simlun \
    bash -c "cp -av /root/rpmbuild/RPMS/* /root/output-rpms-st-simlun/"
