PROJECT_NAME = "{{ cookiecutter.name }}"

# phony targets
.PHONY: all bootstrap init generamba

# default target
all: bootstrap

bootstrap:
	bin/bootstrap.sh

init: bootstrap
	bin/init.sh ${PROJECT_NAME}