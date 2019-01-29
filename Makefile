.PHONY: get_release
get_release:
	scripts/get_release.sh

.PHONY: build
build:
	docker build -t sayplastic/lbrynet .

.PHONY: publish
publish:
	docker push sayplastic/lbrynet

clean:
	rm -rf lbrynet lbrynet-linux.zip
