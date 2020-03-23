#!/bin/sh

uncomment_env_flag() {
	sed -i '' "/$1/s/^# //g" fastlane/.env
}

uncomment_env_flags() {
	flags=("$@")
	for flag in "${flags[@]}";
	do
		uncomment_env_flag $flag	
	done
}

swiftgen >/dev/null

# Download fastlane and update .env
fastfood update
sed -i '' "s|project_name|$1|g" fastlane/.env
uncomment_env_flags GYM_SCHEME GYM_PROJECT CONFIGURATION_ADHOC CONFIGURATION_APPSTORE

# Initialize git
git init >/dev/null
git add -A . >/dev/null
git commit -m "Initial Commit" >/dev/null
git flow init -d >/dev/null
