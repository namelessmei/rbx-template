#!/bin/sh

for file in tests/*.spec.luau; do
    luau $file
done