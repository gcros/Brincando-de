#!/usr/bin/env bash
set -euo pipefail
cat .fanhouse_bundle/part*.b64 > /tmp/fanhouse.b64
base64 --decode /tmp/fanhouse.b64 > /tmp/FanHouse3D_Unity6_GitHubBuild.zip
unzip -q -o /tmp/FanHouse3D_Unity6_GitHubBuild.zip -d .
test -f FanHouse3D_Unity/ProjectSettings/ProjectVersion.txt
test -f FanHouse3D_Unity/Assets/FanHouse3D/Editor/FanHouseCIBuild.cs
echo "Fan House project rebuilt successfully."
