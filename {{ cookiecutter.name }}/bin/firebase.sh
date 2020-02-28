if ! command -v firebase >/dev/null; then
	curl -sL firebase.tools | bash
	firebase login	
fi

firebase projects:create
firebase apps:create iOS --bundle-id $1
firebase apps:sdkconfig iOS -o Resources/Google-Services.plist