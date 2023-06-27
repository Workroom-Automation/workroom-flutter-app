#!/bin/bash
[[ -d artifacts ]] && rm -r artifacts
mkdir artifacts
ls build/web/
cp -R build/web artifacts
