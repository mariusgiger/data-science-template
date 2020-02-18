# some build parameters
ifeq (${VERSION},)
  VERSION=$(shell git describe --tags 2>/dev/null)
endif
ifeq (${GITHASH},)
  GITHASH=$(shell git log -1 --format='%H')
endif
ifeq (${BUILDTIME},)
  BUILDTIME=$(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
endif

.PHONY: all

all: analyze

version: ## Show version
	@echo "  Version: ${VERSION}"
	@echo "  GitHash: ${GITHASH}"
	@echo "BuildTime: ${BUILDTIME}"

install: setup
	( \
       source ./bin/activate; \
       python3 -m pip install --upgrade pip; \
	   python3 -m pip install jupyter; \
    )

setup: ## Sets up the dev environment
	pip3 install virtualenv
	virtualenv -p python3 .

pip-freeze: ## Freeze dependencies
	$(shell source bin/activate && pip freeze > requirements.txt)

pip-install: ## Install dependencies
	$(shell source bin/activate && pip install -r requirements.txt)

analyze: ## Opens analysis env
	$(shell source bin/activate && jupyter notebook)

help: ## Display this help screen
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'