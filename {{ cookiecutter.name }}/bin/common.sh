#!/bin/sh

install_brew_dependency_if_needed () {
	name="$(basename $1)"
	if command -v $1 >/dev/null; then
		echo "✅ $1 is installed"
	else
		echo "⚙️ Installing $1"
		brew install $1
	fi
}

install_brew_dependencies_if_needed () {
	dependencies=("$@")
	for dependency in "${dependencies[@]}";
	do
		install_brew_dependency_if_needed $dependency
	done
}

install_gem_dependency_if_needed () {
	name="$(basename $1)"
	if command -v $1 >/dev/null; then
		echo "✅ $1 is installed"
	else
		echo "⚙️ Installing $1"
		gem install $1
	fi
}

install_gem_dependencies_if_needed () {
	dependencies=("$@")
	for dependency in "${dependencies[@]}";
	do
		install_gem_dependency_if_needed $dependency
	done
}
