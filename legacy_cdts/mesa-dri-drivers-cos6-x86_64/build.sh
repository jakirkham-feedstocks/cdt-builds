#!/bin/bash

set -o errexit -o pipefail

mkdir -p "${PREFIX}"/x86_64-conda_cos6-linux-gnu/sysroot
if [[ -d usr/lib ]]; then
  if [[ ! -d lib ]]; then
    ln -s usr/lib lib
  fi
fi
if [[ -d usr/lib64 ]]; then
  if [[ ! -d lib64 ]]; then
    ln -s usr/lib64 lib64
  fi
fi
pushd ${SRC_DIR}/binary > /dev/null 2>&1
rsync -K -a . "${PREFIX}/x86_64-conda_cos6-linux-gnu/sysroot"
popd