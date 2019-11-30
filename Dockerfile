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

# WIP: ripgrep
# `ripgrep` dependencies
#RUN dnf -y install cargo python3-devel python3-pytest python3-semantic_version python3-setuptools
#RUN curl -O http://ftp-stud.hs-esslingen.de/pub/Mirrors/archive.fedoraproject.org/fedora/linux/releases/28/Everything/source/tree/Packages/r/rust-packaging-5-6.fc28.src.rpm
#RUN rpmbuild --rebuild rust-packaging-5-6.fc28.src.rpm
#RUN dnf -y install rpmbuild/RPMS/noarch/rust-packaging-5-6.el8.noarch.rpm
#RUN curl -O http://ftp-stud.hs-esslingen.de/pub/Mirrors/archive.fedoraproject.org/fedora/linux/releases/28/Everything/source/tree/Packages/r/rust-ansi_term-0.10.2-3.fc28.src.rpm
#RUN rpmbuild --rebuild rust-ansi_term-0.10.2-3.fc28.src.rpm
#RUN curl -O http://ftp-stud.hs-esslingen.de/pub/Mirrors/archive.fedoraproject.org/fedora/linux/releases/28/Everything/source/tree/Packages/r/rust-clap-2.30.0-1.fc28.src.rpm
#RUN rpmbuild --rebuild rust-clap-2.30.0-1.fc28.src.rpm
# `ripgrep`
#RUN curl -O http://ftp-stud.hs-esslingen.de/pub/Mirrors/archive.fedoraproject.org/fedora/linux/releases/28/Everything/source/tree/Packages/r/rust-ripgrep-0.8.1-2.fc28.src.rpm
#RUN rpmbuild --rebuild rust-ripgrep-0.8.1-2.fc28.src.rpm
