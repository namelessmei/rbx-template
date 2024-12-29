#!/bin/sh

for file in benches/*.bench.luau; do
    luau $file --codegen -O2
done