#!/bin/bash
cd /src
git fetch
git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
script/build
script/grunt install
script/grunt mkdeb
mkdir -p /src/output
cp /tmp/atom-build/atom*.deb /src/output/
