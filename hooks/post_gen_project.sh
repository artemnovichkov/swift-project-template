#!/bin/sh

set -e

{% if cookiecutter.fabric == "Yes" %}
curl -O https://s3.amazonaws.com/kits-crashlytics-com/ios/com.twitter.crashlytics.ios/3.9.3/com.crashlytics.ios-manual.zip
unzip com.crashlytics.ios-manual.zip >/dev/null
rm com.crashlytics.ios-manual.zip
mkdir Frameworks
mv Fabric.framework Frameworks/Fabric.framework
mv Crashlytics.framework Frameworks/Crashlytics.framework
echo "✅ Fabric frameworks were added successfully. Don't forget to add API Key to Info.plist and API Key and Build Secret to Fabric Run Script Build Phase. The credentials are available here: https://www.fabric.io/settings/organizations"
{% endif %}

{% if cookiecutter.swiftgen == "Yes" %}
echo "strings:\n  paths: Resources/en.lproj/Localizable.strings\n  templateName: structured-swift4\n  output: Resources/Swiftgen.swift" > swiftgen.yml
swiftgen
{% endif %}

git init >/dev/null
git add -A . >/dev/null
git commit -m "Initial Commit" >/dev/null
git flow init -d >/dev/null
open -a Xcode {{ cookiecutter.name }}.xcodeproj
