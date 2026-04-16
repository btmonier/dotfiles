#!/usr/bin/env bash
# Generate yazi/theme.gruvbox-material.toml by mapping the catppuccin-mocha
# palette in yazi/theme.toml to gruvbox-material (dark, hard contrast).
# Idempotent.
#
# Run from anywhere; resolves paths relative to this script's location.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/../yazi/theme.toml"
DST="$SCRIPT_DIR/../yazi/theme.gruvbox-material.toml"

if [[ ! -r "$SRC" ]]; then
    echo "error: source theme not found at $SRC" >&2
    exit 1
fi

# Mocha -> Gruvbox Material (dark hard) palette. Hex values lowercase.
# See https://github.com/sainnhe/gruvbox-material
SUBS="
1e1e2e|1d2021
181825|282828
11111b|1d2021
313244|282828
45475a|32302f
585b70|3c3836
6c7086|504945
7f849c|665c54
9399b2|7c6f64
74c7ec|7daea3
89b4fa|7daea3
b4befe|7daea3
89dceb|89b482
94e2d5|89b482
bac2de|bdae93
a6adc8|a89984
cdd6f4|d4be98
a6e3a1|a9b665
f9e2af|d8a657
fab387|e78a4e
eba0ac|ea6962
f38ba8|ea6962
cba6f7|d3869b
f5c2e7|d3869b
f2cdcd|ddc7a1
f5e0dc|d4be98
"

SENTINEL="__GSSHHEX__"

sed_args=()
while IFS='|' read -r src dst; do
    [[ -z "$src" || -z "$dst" ]] && continue
    sed_args+=("-e" "s/${src}/${SENTINEL}${dst}/g")
done <<EOF
$SUBS
EOF
sed_args+=("-e" "s/${SENTINEL}//g")

header="# AUTO-GENERATED from theme.toml by scripts/gen-yazi-gruvbox-material-theme.sh
# Do not edit by hand; edit theme.toml and re-run the generator.
"

{
    printf '%s' "$header"
    sed "${sed_args[@]}" "$SRC"
} > "$DST"

echo "wrote $DST"
