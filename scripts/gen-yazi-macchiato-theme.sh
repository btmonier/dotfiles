#!/usr/bin/env bash
# Generate yazi/theme.macchiato.toml by mapping the catppuccin-mocha palette
# in yazi/theme.toml to the catppuccin-macchiato palette. Idempotent.
#
# Run from anywhere; resolves paths relative to this script's location.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/../yazi/theme.toml"
DST="$SCRIPT_DIR/../yazi/theme.macchiato.toml"

if [[ ! -r "$SRC" ]]; then
    echo "error: source theme not found at $SRC" >&2
    exit 1
fi

# Mocha -> Macchiato palette mapping. Hex values intentionally lowercase
# to match the source file. Each entry is "src|dst".
SUBS="
1e1e2e|24273a
181825|1e2030
11111b|181926
cdd6f4|cad3f5
bac2de|b8c0e0
a6adc8|a5adcb
9399b2|939ab7
7f849c|8087a2
6c7086|6e738d
585b70|5b6078
45475a|494d64
313244|363a4f
89b4fa|8aadf4
b4befe|b7bdf8
74c7ec|7dc4e4
89dceb|91d7e3
94e2d5|8bd5ca
a6e3a1|a6da95
f9e2af|eed49f
fab387|f5a97f
eba0ac|ee99a0
f38ba8|ed8796
cba6f7|c6a0f6
f5c2e7|f5bde6
f2cdcd|f0c6c6
f5e0dc|f4dbd6
"

# Build sed expression. Use a sentinel pass so a value that maps to another
# source value can't be re-substituted in the same sweep.
SENTINEL="__GSSHHEX__"

sed_args=()
while IFS='|' read -r src dst; do
    [[ -z "$src" || -z "$dst" ]] && continue
    sed_args+=("-e" "s/${src}/${SENTINEL}${dst}/g")
done <<EOF
$SUBS
EOF
sed_args+=("-e" "s/${SENTINEL}//g")

# Also rewrite the syntect tmTheme reference if a macchiato variant is
# present alongside it; otherwise leave the mocha file (yazi will fall back).
header="# AUTO-GENERATED from theme.toml by scripts/gen-yazi-macchiato-theme.sh
# Do not edit by hand; edit theme.toml and re-run the generator.
"

{
    printf '%s' "$header"
    sed "${sed_args[@]}" "$SRC" \
        | sed 's|Catppuccin-mocha\.tmTheme|Catppuccin-macchiato.tmTheme|g'
} > "$DST"

echo "wrote $DST"
