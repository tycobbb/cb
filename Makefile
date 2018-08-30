.DEFAULT_GOAL := help

# -- context --
# location for ruby binaries
rbin = ./bin
# location for js binaries
jbin = ./node_modules/.bin

# -- run --
## starts the app
start:
	$(rbin)/rails server
start/wds:
	$(rbin)/webpack-dev-server

.PHONY: start

# -- db --
## resets the dev database
db/reset:
	$(rbin)/rails db:reset
db/migrate:
	$(rbin)/rails db:migrate

.PHONY: db/reset db/migrate

# -- test --
## runs all the tests
test: test/rails test/js
## runs the rails tests
test/rails:
	$(rbin)/rails test
## runs the javascript tests
test/js:
	$(jbin)/jest
## runs the javascript tests and updates all snapshots
test/js/snapshot:
	$(jbin)/jest -u
## runs the javascript tests in watch mode
test/js/watch:
	$(jbin)/jest --watch

.PHONY: test test/rails test/js test/js/snapshot test/js/watch

# -- lint --
jslint = $(jbin)/tslint

## lints all the code
lint: lint/rails lint/js
## lints all the code and fixes errors
lint/fix: lint/rails/fix lint/js/fix

## lints the rails code
lint/rails:
	$(rbin)/rubocop
## lints the rails code and fixes errors
lint/rails/fix:
	$(rbin)/rubocop -a

## lints the js code
lint/js:
	$(jbin)/tslint
## lints the js code and fixes any errors it can
lint/js/fix:
	$(jbin)/tslint

.PHONY: lint lint/fix lint/rails lint/rails/fix lint/js lint/js/fix

# -- console --
## connects a rails console
console:
	$(rbin)/rails console

.PHONY: console

# -- verify --
# verifies the code is correct
verifiy: verify/rails verify/js
# verifies the rails code is correct
verify/rails: lint/rails test/rails
# verifies the rails code is correct
verify/js: lint/js test/js

.PHONY = verify verify/rails verify/js

# -- help --
help:
	@awk "$$HELP" $(MAKEFILE_LIST)

define HELP
BEGIN {
	print "\033[;1musage:\033[0m";
	print "  make <command>\n";
	print "\033[;1mcommands:\033[0m";
}
/^## (.*)$$/ {
	$$1=""; docs=$$0;
	getline;
	sub(/:/, "", $$1);
	printf "  \033[36m%-16s\033[0m %s\n", $$1, docs;
}
endef
export HELP

.PHONY = help
