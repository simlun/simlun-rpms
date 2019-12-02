#!/bin/bash -ex
docker build -f Dockerfile.xdotool -t simlun-rpms-xdotool .
mkdir -p output-rpms-xdotool
docker run --rm -it -v $(pwd)/output-rpms-xdotool:/root/output-rpms-xdotool simlun-rpms-xdotool \
    bash -c "cp -av /root/rpmbuild/RPMS/* /root/output-rpms-xdotool/"
