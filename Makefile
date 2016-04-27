getdeps: ## get dependencies
	bundle

rubotest: ## run rubocop with our config file
	rubocop -D -c rubocop.yml

rubofix: ## run rubocop and attempt to auto correct
	rubocop -D -a -c rubocop.yml

kitchenconverge: ## kitchen converge
	kitchen converge

foodtest: ## run foodcritic
	foodcritic .

travisci: rubotest foodtest ## tests to run in travis when a pr is created

test: rubotest foodtest kitchenconverge ## tests to run locally when developing

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: help

.DEFAULT_GOAL := help
