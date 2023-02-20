#!/bin/sh
set +x
cd /tmp
curl -LO https://go.dev/dl/go1.20.1.linux-arm64.tar.gz
curl -LO https://pkg.osquery.io/deb/osquery_5.7.0-1.linux_arm64.deb
sudo dpkg -i osquery_5.7.0-1.linux_arm64.deb 
cd /usr/local
sudo tar -zxvf /tmp/go1.20.1.linux-arm64.tar.gz 
sudo apt update
sudo apt upgrade -y
sudo apt install -y libbpf-dev build-essential linux-tools-common pkg-config clang linux-image-$(uname -r) libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm
rm -Rf /tmp/go1.20.1.linux-arm64.tar.gz /tmp/osquery_5.7.0-1.linux_arm64.deb
export PATH=/usr/local/go/bin:$PATH
cd $HOME
git clone https://github.com/chainguard-dev/osquery-defense-kit.git
cd $HOME/osquery-defense-kit
make out/osqtool
./out/osqtool --max-results=0 verify detection/ 2>&1 | tee "$HOME/results-$(uname -r)-$(date).txt"
