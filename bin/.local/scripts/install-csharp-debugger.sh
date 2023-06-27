#!/usr/bin/env bash

INSTALL_FOLDER="$HOME/.local/share/nvim"

# Remove existing installation
rm -rf "$INSTALL_FOLDER/netcoredbg"

# Release download URL
RELEASE_URL=https://github.com/Samsung/netcoredbg/releases/download/2.2.0-974/netcoredbg-osx-amd64.tar.gz

# Download the debugger
curl -k -L $RELEASE_URL --output netcoredbg.tar.gz && tar -xzf netcoredbg.tar.gz -C "$INSTALL_FOLDER" && rm netcoredbg.tar.gz

