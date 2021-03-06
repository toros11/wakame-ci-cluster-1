#!/bin/bash
#
# requires:
#  bash
#
# usage:
#  $0 CTID (192.168.2.CTID)
#

. "${BASH_SOURCE[0]%/*}/bootstrap-common.sh"

distro_name=fedora
distro_ver=20

. "${BASH_SOURCE[0]%/*}/bootstrap-common-setup.sh"

### post-install

#### copy.txt

#### execscript

. "${BASH_SOURCE[0]%/*}/bootstrap-common-mount.sh"

chroot ${rootfs_path} bash -ex <<EOS
  yum install -y curl sudo
  yum install -y qemu-kvm qemu-img
  yum install -y parted kpartx e2fsprogs
  yum install -y lxc lxc-extra lxc-templates
EOS

. "${BASH_SOURCE[0]%/*}/bootstrap-common-adduser.sh"
. "${BASH_SOURCE[0]%/*}/bootstrap-common-umount.sh"
. "${BASH_SOURCE[0]%/*}/bootstrap-common-postsetup.sh"

# > $ ping 192.168.2.249
# > ping: icmp open socket: Operation not permitted
# http://comments.gmane.org/gmane.linux.redhat.fedora.general/409425
lxc-attach -n ${ctid} -- bash -ex <<EOS
  yum -y reinstall iputils
EOS
