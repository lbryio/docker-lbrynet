all:
	make get_release
	make image
	make publish
	make clean

get_release:
	scripts/get_release.sh

.PHONY: image
image:
	docker build -t lbryweb/lbrynet:$(VERSION) -t lbryweb/lbrynet:latest .

.PHONY: publish
publish:
	scripts/publish.sh

clean:
	rm -rf lbrynet lbrynet-linux.zip
