.PHONY: get_release
get_release:
	scripts/get_release.sh

.PHONY: build
build:
	docker build -t sayplastic/lbrynet:$(VERSION) .

.PHONY: publish
publish:
	scripts/publish.sh

clean:
	rm -rf lbrynet lbrynet-linux.zip
