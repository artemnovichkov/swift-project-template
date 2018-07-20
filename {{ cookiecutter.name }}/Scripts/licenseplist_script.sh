#!/bin/bash

if [ $CONFIGURATION = "Analyze" ]; then
  if which license-plist >/dev/null; then
    license-plist --output-path $PRODUCT_NAME/Settings.bundle --suppress-opening-directory
  else
    echo "warning: LicensePlist not installed, download from https://github.com/mono0926/LicensePlist"
    exit 1
  fi
fi
