#!/usr/bin/env bash

UNAME_OS="$(uname -s)"
arch="$(uname -m)"

mkdir -p releases

case "${UNAME_OS}" in
    Linux*)  os=linux;;
    Darwin*) os=macos;;
    *)       os="${UNAME_OS}";;
esac    

dub build -b release
tar czvf releases/dtimer-$os-$arch.tar.gz ./dtimer
