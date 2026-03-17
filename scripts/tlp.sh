#!/bin/bash
set -euo pipefail

# tlp (teleport): Simplified SCP transfer command with colorful CLI

# Colors (only when stdout is a TTY and NO_COLOR is not set)
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    CYAN='\033[0;36m'
    RESET='\033[0m'
else
    RED='' GREEN='' YELLOW='' CYAN='' RESET=''
fi

# Configurable paths (env with defaults)
LOCAL_DIR="${TLP_LOCAL_DIR:-$HOME/Downloads}"
REMOTE_BASE="${TLP_REMOTE:-bm646@cbsulogin.biohpc.cornell.edu:Downloads/}"
# Ensure trailing slash for consistent path joining
[[ "$LOCAL_DIR" != */ ]] && LOCAL_DIR="$LOCAL_DIR/"
[[ "$REMOTE_BASE" != */ ]] && REMOTE_BASE="$REMOTE_BASE/"

show_help() {
    echo -e "${CYAN}Usage:${RESET} tlp [-t] <remote_path> | tlp -t <local_path> [local_path ...]"
    echo -e "  ${YELLOW}-t:${RESET} Transfer local path(s) to remote (default: pull remote path to local)"
    echo -e "  ${YELLOW}-h, --help:${RESET} Display this help message"
    echo ""
    echo -e "${CYAN}Examples:${RESET}"
    echo -e "  ${GREEN}tlp <remote_path>${RESET}      # Copy remote path to local $LOCAL_DIR"
    echo -e "  ${GREEN}tlp -t <local_path> [ ... ]${RESET}   # Transfer local path(s) to remote"
    echo -e "  ${GREEN}tlp -h${RESET}                # Display this help message"
    echo ""
    echo -e "Override via env: ${YELLOW}TLP_LOCAL_DIR${RESET}, ${YELLOW}TLP_REMOTE${RESET}"
}

# Handle --help before getopts (getopts doesn't support long options)
case "${1:-}" in
    --help) show_help; exit 0 ;;
esac

UPLOAD=
while getopts 'ht' opt; do
    case $opt in
        h) show_help; exit 0 ;;
        t) UPLOAD=1 ;;
        *) show_help; exit 1 ;;
    esac
done
shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
    echo -e "${RED}Error:${RESET} No path specified."
    show_help
    exit 1
fi

if [ -n "${UPLOAD:-}" ]; then
    for local_path in "$@"; do
        echo -e "${CYAN}Transferring${RESET} ${GREEN}${local_path}${RESET} ${CYAN}to remote...${RESET}"
        scp -r "$local_path" "$REMOTE_BASE" && echo -e "${GREEN}Transfer complete: ${local_path}${RESET}"
    done
else
    if [ $# -gt 1 ]; then
        echo -e "${RED}Error:${RESET} Pull mode accepts a single remote path. Use ${YELLOW}-t${RESET} to push multiple local paths."
        exit 1
    fi
    remote_path="$1"
    echo -e "${CYAN}Copying${RESET} ${GREEN}${remote_path}${RESET} ${CYAN}from remote to local...${RESET}"
    scp -r "${REMOTE_BASE}${remote_path}" "$LOCAL_DIR" && echo -e "${GREEN}Copy complete!${RESET}"
fi
