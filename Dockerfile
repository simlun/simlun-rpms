FROM centos:8
RUN dnf -y install epel-release
RUN dnf -y install gcc rpm-build rpm-devel rpmlint make bash diffutils patch rpmdevtools
RUN dnf -y install git

RUN rpmdev-setuptree

WORKDIR /root

# `xclip` required by `pass`
RUN dnf -y install autoconf automake libICE-devel libX11-devel libXext-devel libXmu-devel libtool
RUN curl -O https://ftp.acc.umu.se/mirror/fedora/linux/releases/31/Everything/source/tree/Packages/x/xclip-0.13-8.fc31.src.rpm
RUN rpmbuild --rebuild xclip-0.13-8.fc31.src.rpm
RUN dnf -y install /root/rpmbuild/RPMS/x86_64/xclip-0.13-8.el8.x86_64.rpm

# `pass`
RUN curl -O https://ftp.acc.umu.se/mirror/fedora/linux/releases/31/Everything/source/tree/Packages/p/pass-1.7.3-4.fc31.src.rpm
RUN dnf -y install perl-generators tree
RUN rpmbuild --rebuild pass-1.7.3-4.fc31.src.rpm
