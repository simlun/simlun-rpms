# simlun-rpms

RPMs built by me because they were missing in CentOS 8.

Browse the repo at https://bintray.com/simlun/centos-8


## Install repo

```
# wget https://bintray.com/simlun/centos-8/rpm -O /etc/yum.repos.d/bintray-simlun-centos-8.repo
```


## Install i3

```
# dnf install 'dnf-command(config-manager)' epel-release
# dnf config-manager --set-enabled PowerTools
# dnf install xorg-x11-server-Xorg xorg-x11-xinit xterm i3
$ echo "exec i3" > ~/.xinitrc
$ startx
```
