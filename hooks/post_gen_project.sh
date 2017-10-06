#!/bin/sh

set -e

git init
git add -A .
git commit -m "Initial Commit"
git flow init -d
open -a Xcode {{ cookiecutter.name }}.xcodeproj
