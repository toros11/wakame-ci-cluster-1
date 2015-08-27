#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

sudo /bin/bash -e <<EOS
  ../common/kill.sh
  ../common/qcow2-init.sh
  ../common/run.sh
EOS
