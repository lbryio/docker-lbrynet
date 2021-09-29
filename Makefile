image:
	scripts/build.sh ${VERSION}

.PHONY: push
push:
	scripts/push.sh ${VERSION}

clean:
	rm -rf lbrynet lbrynet-linux.zip
