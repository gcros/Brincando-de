#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_DIR="$(cd "$PROJECT_DIR/.." && pwd)"
BUNDLE_DIR="$REPO_DIR/.fanhouse_bundle"
TMP_DIR="$REPO_DIR/.fanhouse_build_tmp"
B64_FILE="$REPO_DIR/.fanhouse_build_tmp.b64"
ZIP_FILE="$REPO_DIR/.fanhouse_build_tmp.zip"

echo "Fan House pre-build: rebuilding full Unity project..."
echo "Project dir: $PROJECT_DIR"
echo "Repo dir: $REPO_DIR"

test -d "$BUNDLE_DIR"

cat "$BUNDLE_DIR"/part*.b64 > "$B64_FILE"
base64 --decode "$B64_FILE" > "$ZIP_FILE"

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

ZIP_WIN="$(cygpath -w "$ZIP_FILE")"
TMP_WIN="$(cygpath -w "$TMP_DIR")"

echo "Extracting bundle with Windows PowerShell..."
powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath '$ZIP_WIN' -DestinationPath '$TMP_WIN' -Force"

test -f "$TMP_DIR/FanHouse3D_Unity/Assets/FanHouse3D/Editor/FanHouseSceneBuilder.cs"
test -f "$TMP_DIR/FanHouse3D_Unity/Assets/FanHouse3D/Editor/FanHouseCIBuild.cs"

cp -a "$TMP_DIR/FanHouse3D_Unity/." "$PROJECT_DIR/"

rm -rf "$TMP_DIR"
rm -f "$B64_FILE" "$ZIP_FILE"

echo "Fan House pre-build: project restored successfully."
