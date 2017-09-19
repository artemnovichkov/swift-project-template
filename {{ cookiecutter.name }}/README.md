# {{ cookiecutter.name }}

## How to build
1. Install [Carthage](https://github.com/Carthage/Carthage):

	```bash
	brew install carthage
	```
2. Install [SwiftLint](https://github.com/realm/SwiftLint):

	```bash
	brew install swiftlint
	```
3. Run in project directory:

	```bash
	carthage update --platform iOS
	```
4. Open `{{ cookiecutter.name }}.xcodeproj` in last Xcode version.
5. Press `Cmd+R` or select `Product > Run` in menu.

