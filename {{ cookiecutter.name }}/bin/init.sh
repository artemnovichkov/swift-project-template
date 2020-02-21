#!/bin/sh

DIR=`dirname $0`
. $DIR/common.sh

#Download fastlane and update project name in .env
fastfood update
sed -i '' "s/project_name/$1/g" fastlane/.env