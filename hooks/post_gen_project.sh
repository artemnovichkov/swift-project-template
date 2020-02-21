#!/bin/sh

set -e

{% if cookiecutter.fabric == "Yes" %}
carthage update --platform iOS
echo "✅ Fabric frameworks were added successfully. Don't forget to add API Key to Info.plist and API Key and Build Secret to Fabric Run Script Build Phase. The credentials are available here: https://www.fabric.io/settings/organizations"
{% endif %}

{% if cookiecutter.swiftgen == "Yes" %}
echo "input_dir: Resources\n
output_dir: Resources
strings:
  inputs: en.lproj/Localizable.strings
  outputs:
    - templateName: structured-swift4
      output: Strings.swift
xcassets:
  inputs:
    - Assets.xcassets
  outputs:
    - templateName: swift4
      output: Assets.swift" > swiftgen.yml

echo "if [ \$CONFIGURATION = \"Analyze\" ]; then
  if which swiftgen >/dev/null; then
    if [ -f "$SRCROOT"/Resources/Assets.swift ]; then
        chmod +w "$SRCROOT"/Resources/Assets.swift
    fi
    if [ -f "$SRCROOT"/Resources/Strings.swift ]; then
        chmod +w "$SRCROOT"/Resources/Strings.swift
    fi
    swiftgen
    if [ -f "$SRCROOT"/Resources/Assets.swift ]; then
        chmod -w "$SRCROOT"/Resources/Assets.swift
    fi
    if [ -f "$SRCROOT"/Resources/Strings.swift ]; then
        chmod -w "$SRCROOT"/Resources/Strings.swift
    fi
  else
    echo \"warning: Swiftgen not installed, download from https://github.com/SwiftGen/SwiftGen\"
    exit 1
  fi
fi" > Scripts/swiftgen_script.sh

chmod +x Scripts/swiftgen_script.sh
swiftgen
{% endif %}

git init >/dev/null
git add -A . >/dev/null
git commit -m "Initial Commit" >/dev/null
git flow init -d >/dev/null
xed . >/dev/null
