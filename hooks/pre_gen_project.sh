#!/bin/sh

set -e

install_if_needed () {
	if command -v $1 >/dev/null; then
		echo "✅ $1 is installed"
	else
		echo "⚙️ Installing $1"
		brew install $1
	fi
}

echo "Check requirements"

{% if cookiecutter.fabric == "Yes" %}
install_if_needed carthage
{% endif %}

{% if cookiecutter.swiftgen == "Yes" %}
install_if_needed swiftgen
{% endif %}

install_if_needed git-flow

{% if cookiecutter.licenseplist == "Yes" %}
install_if_needed licenseplist
{% endif %}