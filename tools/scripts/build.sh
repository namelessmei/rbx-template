#!/bin/sh

set -e

if [ ! -d "Packages" ]; then
    sh tools/scripts/install.sh
fi

rojo sourcemap default.project.json --output sourcemap.json

if [ -d "build" ]; then
    rm -rf build
fi

mkdir build

ROBLOX_DEV=false darklua process --config .darklua.json assets build/assets
ROBLOX_DEV=false darklua process --config .darklua.json client build/client
ROBLOX_DEV=false darklua process --config .darklua.json server build/server
ROBLOX_DEV=false darklua process --config .darklua.json modules build/modules
ROBLOX_DEV=false darklua process --config .darklua.json std build/std
ROBLOX_DEV=false darklua process --config .darklua.json ui build/ui
ROBLOX_DEV=false darklua process --config .darklua.json sys build/sys

rojo build build.project.json --output build/output.rbxlx