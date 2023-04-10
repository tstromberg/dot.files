#!/bin/bash
set -ux -o pipefail
arch=$(uname -m)
goarch=$(echo $arch | sed -e s/x86_64/amd64/g -e s/aarch64/arm64/g)

if [[ ! -x /usr/local/go/bin/go ]]; then
  curl -L https://go.dev/dl/go1.20.1.linux-${goarch}.tar.gz | sudo tar -C /usr/local -zxvf -
fi

export PATH=/usr/local/go/bin:$PATH
cd /tmp

if [[ -x /usr/bin/yum ]]; then
  if [[ ! -x /usr/bin/osqueryi ]]; then
    curl -LO https://pkg.osquery.io/rpm/osquery-5.7.0-1.linux.${arch}.rpm
    sudo rpm -ivh osquery-5.7.0-1.linux.${arch}.rpm
  fi
  sudo yum update -y
  sudo yum install -y git ncurses-devel make gcc bc bison flex elfutils-libelf-devel openssl-devel grub2 bcc-tools
fi

if [[ -x /usr/bin/zypper ]]; then
  if [[ ! -x /usr/bin/osqueryi ]]; then
    curl -LO https://pkg.osquery.io/rpm/osquery-5.7.0-1.linux.${arch}.rpm
    sudo rpm -ivh osquery-5.7.0-1.linux.${arch}.rpm
  fi
  sudo zypper update -y
  sudo zypper install -y git ncurses-devel make gcc bc bison flex elfutils-libelf-devel openssl-devel grub2 bcc-tools
fi

if [[ -x /usr/bin/apt ]]; then
  if [[ ! -x /usr/bin/osqueryi ]]; then
    curl -LO https://pkg.osquery.io/deb/osquery_5.7.0-1.linux_${goarch}.deb
    sudo dpkg -i osquery_5.7.0-1.linux_${goarch}.deb
  fi

  sudo apt update
  sudo apt upgrade -y
  packages="git libbpf-dev build-essential pkg-config clang linux-image-$(uname -r) libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm tmux"

  # ubuntu
  if [[ ! -f /etc/debian_version ]]; then
    packages="linux-tools-common $packages"
  fi
  sudo apt install -y $packages
  sudo apt build-dep -y linux
fi

rm -Rf /tmp/go1.20.1.linux-${goarch}.tar.gz /tmp/osquery_5.7.0-1.linux_${goarch}.deb

cd /tmp/lima/osquery-defense-kit
#cd $HOME
#if [[ ! -d "osquery-defense-kit" ]]; then
#  git clone https://github.com/chainguard-dev/osquery-defense-kit.git
#fi
#cd $HOME/osquery-defense-kit
#git fetch
#git pull
./out/osqtool --help || rm -f out/osqtool
make out/osqtool
sudo ./out/osqtool run detection | tee "$HOME/detection-$(uname -r)-$(date).txt"
sudo ./out/osqtool run incident_response > "$HOME/incident-$(uname -r)-$(date).txt"
