#!/bin/bash

version=1.9.5
commit=a1c09b93
target_name="geth-linux-amd64-${version}-${commit}"
target_file="${target_name}.tar.gz"
release_url="https://gethstore.blob.core.windows.net/builds/$target_file"

if ! [ -f $target_file ] 
then
  curl -LO $release_url
fi
tar -zxvf $target_file
sudo mv $target_name/geth /usr/bin

# Install Requirements
if ! [ -x "$(command -v go)" ] 
then
  sudo yum install -y git golang  
fi
