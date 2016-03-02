#!/bin/bash -e

temp_dir=$(mktemp -d)
pushd ${temp_dir}

wget https://github.com/dkourilov/env/archive/master.zip -O a.zip
unzip a.zip
cd env-master
(./install.sh || true)

popd
rm -rf ${temp_dir}

