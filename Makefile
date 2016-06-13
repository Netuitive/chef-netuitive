bumpmajor: ## bumps version for a major release
	semver inc major
	sed -i -r "s/(([0-9])+\.){2}([0-9]+)/`semver | tr -d \v`/" metadata.rb
	cat metadata.rb

bumpminor: ## bumps version for a minor release
	semver inc minor
	sed -i -r "s/(([0-9])+\.){2}([0-9]+)/`semver | tr -d \v`/" metadata.rb
	cat metadata.rb

bumppatch: ## bumps version for path/hotfix release
	semver inc patch
	sed -i -r "s/(([0-9])+\.){2}([0-9]+)/`semver | tr -d \v`/" metadata.rb
	cat metadata.rb

foodtest: ## run foodcritic
	foodcritic .

getdeps: ## get dependencies
	bundle

gittag: ## makes tag in git
	-git tag -d `semver`
	-git push origin :refs/tags/`semver`
	git tag -a `semver tag` -m "tagging `semver` for release"
	git push origin `semver`

kitchenconverge: ## kitchen converge
	kitchen converge

kitchenverify: ## kitchen verify
	kitchen verify

rubofix: ## run rubocop and attempt to auto correct
	rubocop -D -a -c rubocop.yml

rubotest: ## run rubocop with our config file
	rubocop -D -c rubocop.yml

test: rubotest foodtest kitchenconverge kitchenverify ## tests to run locally when developing

travisci: rubotest foodtest ## tests to run in travis when a pr is created

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: help

.DEFAULT_GOAL := help
