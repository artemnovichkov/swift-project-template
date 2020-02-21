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
    if [ -f Resources/Assets.swift ]; then
        chmod +w Resources/Assets.swift
    fi
    if [ -f Resources/Strings.swift ]; then
        chmod +w Resources/Strings.swift
    fi
    swiftgen
    if [ -f Resources/Assets.swift ]; then
        chmod -w Resources/Assets.swift
    fi
    if [ -f Resources/Strings.swift ]; then
        chmod -w Resources/Strings.swift
    fi
  else
    echo \"warning: Swiftgen not installed, download from https://github.com/SwiftGen/SwiftGen\"
    exit 1
  fi
fi" > Scripts/swiftgen_script.sh

chmod +x Scripts/swiftgen_script.sh
swiftgen >/dev/null
{% endif %}

{% if cookiecutter.licenseplist == "Yes" %}
echo "#!/bin/bash

if [ $CONFIGURATION = \"Analyze\" ]; then
  if which license-plist >/dev/null; then
    license-plist --output-path $PRODUCT_NAME/Settings.bundle --suppress-opening-directory
  else
    echo \"warning: LicensePlist not installed, download from https://github.com/mono0926/LicensePlist\"
    exit 1
  fi
fi" > Scripts/licenseplist_script.sh
chmod +x Scripts/licenseplist_script.sh
{% endif %}

make init
