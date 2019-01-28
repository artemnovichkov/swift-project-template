#!/bin/sh

set -e

{% if cookiecutter.fabric == "Yes" %}
carthage update --platform iOS
echo "✅ Fabric frameworks were added successfully. Don't forget to add API Key to Info.plist and API Key and Build Secret to Fabric Run Script Build Phase. The credentials are available here: https://www.fabric.io/settings/organizations"
{% endif %}

{% if cookiecutter.swiftgen == "Yes" %}
echo \
"input_dir: Resources\n"\
"output_dir: Resources\n"\
"strings:\n"\
"  inputs: en.lproj/Localizable.strings\n"\
"  outputs:\n"\
"    - templateName: structured-swift4\n"\
"      output: Strings.swift\n"\
"xcassets:\n"\
"  inputs:\n"\
"    - Assets.xcassets\n"\
"  outputs:\n"\
"    - templateName: swift4\n"\
"      output: Assets.swift" > swiftgen.yml

echo \
"if [ $CONFIGURATION = \"Analyze\" ]; then\n"\
"  if which swiftgen >/dev/null; then\n"\
"    swiftgen\n"\
"  else\n"\
"    echo \"warning: Swiftgen not installed, download from https://github.com/SwiftGen/SwiftGen\"\n"\
"    exit 1\n"\
"  fi\n"\
"fi" > Scripts/swiftgen_script.sh

chmod +x Scripts/swiftgen_script.sh
swiftgen
{% endif %}

git init >/dev/null
git add -A . >/dev/null
git commit -m "Initial Commit" >/dev/null
git flow init -d >/dev/null
open -a /Applications/Xcode.app {{ cookiecutter.name }}.xcodeproj
