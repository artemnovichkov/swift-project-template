#!/bin/sh

DIR=`dirname $0`
. $DIR/common.sh

echo "Check requirements"

install_brew_dependencies_if_needed git-flow carthage swiftlint swiftgen license-plist artemnovichkov/projects/fastfood
install_gem_dependencies_if_needed generamba

carthage bootstrap --platform iOS