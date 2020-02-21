#!/bin/sh

install_dependency_if_needed () {
	if command -v $1 >/dev/null; then
		echo "✅ $1 is installed"
	else
		echo "⚙️ Installing $1"
		brew install $1
	fi
}

install_dependencies_if_needed () {
	dependencies=("$@")
	for dependency in "${dependencies[@]}";
	do
		install_dependency_if_needed $dependency
	done
}