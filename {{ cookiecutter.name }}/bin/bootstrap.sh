#!/bin/sh

DIR=`dirname $0`
. $DIR/common.sh

echo "Check requirements"

install_dependencies_if_needed git-flow carthage swiftlint swiftgen generamba license-plist fastfood

carthage bootstrap --platform iOS