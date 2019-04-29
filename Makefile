all:
	make latest_image
	make publish
	make clean

latest_image:
	scripts/get_release.sh

latest_rc_image:
	scripts/get_release.sh rc

.PHONY: publish
publish:
	scripts/publish.sh

clean:
	rm -rf lbrynet lbrynet-linux.zip
