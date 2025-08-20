#!/usr/bin/env bash

set -euo pipefail

# Installer for a simple Git pre-commit hook
# - Prints a greeting
# - Fetches and runs a linter from a pinned gist

HOOK_DIR=".git/hooks"
HOOK_FILE="$HOOK_DIR/pre-commit"

mkdir -p "$HOOK_DIR"

cat > "$HOOK_FILE" <<'EOF'
#!/usr/bin/env bash

# Simple greeting and linter runner
echo "Helle Codex"

URL="https://gist.githubusercontent.com/lociko/08dc519c70e8874e11a42c41fb3d1e0c/raw/96201b55b6129c0cb3fef41b6c283cf8f298077d/linter.sh"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL --max-time 10 "$URL" | bash
elif command -v wget >/dev/null 2>&1; then
  wget -qO- "$URL" | bash
else
  echo "No curl or wget found; skipping linter" >&2
fi
EOF

chmod +x "$HOOK_FILE"

echo "Installed pre-commit hook to $HOOK_FILE"
