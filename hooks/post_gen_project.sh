#!/bin/sh

set -e

{% if cookiecutter.fabric == "Yes" %}
curl -O https://s3.amazonaws.com/kits-crashlytics-com/ios/com.twitter.crashlytics.ios/3.9.3/com.crashlytics.ios-manual.zip
unzip com.crashlytics.ios-manual.zip
rm com.crashlytics.ios-manual.zip
mkdir Frameworks
mv Fabric.framework Frameworks/Fabric.framework
mv Crashlytics.framework Frameworks/Crashlytics.framework
echo "✅ Fabric frameworks were added successfully. Don't forget to add API Key to Info.plist and API Key and Build Secret to Fabric Run Script Build Phase. The credentials are available here: https://www.fabric.io/settings/organizations"
{% endif %}

git init
git add -A .
git commit -m "Initial Commit"
git flow init -d
open -a Xcode {{ cookiecutter.name }}.xcodeproj
