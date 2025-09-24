#!/usr/bin/env bash
set -e

. /etc/os-release

if ! command -v curl >/dev/null 2>&1; then
    apt-get update
    apt-get install -y curl
fi

if [ "$VERSION_CODENAME" = "jammy" ]; then
    curl -L -o /tmp/nvim.deb "https://github.com/neovim/neovim-releases/releases/download/v0.11.4/nvim-linux-x86_64.deb"
    apt-get update
    apt-get install -y /tmp/nvim.deb
    rm /tmp/nvim.deb
elif [ "$VERSION_CODENAME" = "noble" ]; then
    apt-get update
    apt-get install -y neovim
else
    echo "Unsupported Ubuntu version: $VERSION_CODENAME"
    exit 1
fi
