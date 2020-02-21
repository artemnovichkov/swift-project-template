#!/bin/sh

#Download fastlane and update project name in .env
fastfood update
sed -i '' "s/project_name/$1/g" fastlane/.env

#Initialize git
git init >/dev/null
git add -A . >/dev/null
git commit -m "Initial Commit" >/dev/null
git flow init -d >/dev/null

#Open Xcode
xed . >/dev/null