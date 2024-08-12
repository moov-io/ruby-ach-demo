VERSION := $(shell cat ./version | tr -d '\n')

.PHONY: build
build:
	docker build --pull -t moov/ruby-ach-demo:$(VERSION) -f Dockerfile .
	docker tag moov/ruby-ach-demo:$(VERSION) moov/ruby-ach-demo:latest

run:
	docker compose up -d ach
	$(shell echo "")
	@docker compose run demo

# From https://github.com/genuinetools/img
.PHONY: AUTHORS
AUTHORS:
	@$(file >$@,# This file lists all individuals having contributed content to the repository.)
	@$(file >>$@,# For how it is generated, see `make AUTHORS`.)
	@echo "$(shell git log --format='\n%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf)" >> $@

release: docker AUTHORS
	go vet ./...
	go test ./...
	git tag -f $(VERSION)

release-push:
	docker push moov/ruby-ach-demo:$(VERSION)
	git push --tags origin $(VERSION)
