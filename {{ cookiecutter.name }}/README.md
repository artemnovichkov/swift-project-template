# {{ cookiecutter.name }}

## How to build
1. Install [Carthage](https://github.com/Carthage/Carthage):

	```bash
	brew install carthage
	```
2. Run a command in a project directory:

	```bash
	carthage bootstrap --platform iOS
	```
3. Open `{{ cookiecutter.name }}.xcodeproj` in last Xcode version.
4. Press `Cmd+R` or select `Product > Run` in menu.

## Analyzing

1. Install [Swiftlint](https://github.com/realm/swiftlint):

	```bash
	brew install swiftlint
	```
	
2. Press `⌘+Shift+B` or select `Product > Analyze` in menu.
