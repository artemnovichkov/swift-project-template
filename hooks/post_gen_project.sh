#!/bin/sh

set -e

git init
git add -A .
git commit -m "Initial Commit"
open -a Xcode {{ cookiecutter.name }}.xcodeproj