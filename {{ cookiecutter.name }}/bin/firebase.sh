if ! command -v firebase >/dev/null; then
	curl -sL firebase.tools | bash
	firebase login	
fi

echo "Please specify a unique project id (warning: cannot be modified afterward) [6-30 characters, lowercase]:"
read project_id
firebase projects:create $project_id
echo "Waiting before creation iOS app in Firebase project 😴"
sleep 5
firebase apps:create iOS --bundle-id $1 --project $project_id
firebase apps:sdkconfig iOS -o Resources/GoogleService-Info.plist --project $project_id
echo "Firebase project was successfully created 🎉 Don't forget to add GoogleService-Info.plist and related frameworks to Xcode project"