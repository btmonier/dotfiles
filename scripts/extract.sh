#!/usr/bin/env bash
set -euo pipefail

for f in "$@"; do
    if [ ! -f "$f" ]; then
        echo "Not a file: $f"
        continue
    fi

    case "$f" in
        *.tar.gz|*.tgz)   tar xzf "$f" ;;
        *.tar.bz2|*.tbz2) tar xjf "$f" ;;
        *.tar.xz|*.txz)   tar xJf "$f" ;;
        *.tar.zst)        tar --zstd -xf "$f" ;;
        *.tar)            tar xf "$f" ;;
        *.zip)            unzip -o "$f" ;;
        *.gz)             gunzip "$f" ;;
        *.bz2)            bunzip2 "$f" ;;
        *.xz)             unxz "$f" ;;
        *.7z)             7z x "$f" ;;
        *.rar)            unrar x "$f" ;;
        *)                echo "Unknown format: $f"; continue ;;
    esac

    rm -f "$f"
done
