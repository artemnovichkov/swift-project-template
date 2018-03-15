#!/bin/sh

set -e

{% if cookiecutter.fabric == "Yes" %}
carthage update --platform iOS
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
# open -a Xcode {{ cookiecutter.name }}.xcodeproj
