PROJECT_NAME = "{{ cookiecutter.name }}"
BUNDLE_ID = "{{ cookiecutter.bundle_identifier }}"

# phony targets
.PHONY: all bootstrap init firebase_init

# default target
all: bootstrap

bootstrap:
	bin/bootstrap.sh

init: bootstrap
	bin/init.sh ${PROJECT_NAME}

firebase_init:
	bin/firebase.sh ${BUNDLE_ID}