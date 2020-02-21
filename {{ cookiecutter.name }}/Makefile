PROJECT_NAME = `{{ cookiecutter.name }}`

# phony targets
.PHONY: all bootstrap init generamba

# default target
all: bootstrap

bootstrap:
	bin/bootstrap.sh

init: bootstrap
	bin/init.sh ${PROJECT_NAME}

generamba:
	generamba template install

gen_service:
	generamba gen $MODULE_NAME $TEMPLATE_NAME --module-path Classes/BusinessLogic/Services

gen_module:
	generamba gen $MODULE_NAME $TEMPLATE_NAME --module-path Classes/Presentation/Modules