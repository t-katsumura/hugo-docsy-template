

HUGO_VERSION:=v0.125.7
HUGO_ARCH:=$(shell uname -m)
DOCSY_VERSION:=v0.11.0


.PHONY: install-hugo
install-hugo:
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-$(HUGO_ARCH).deb \
	sudo dpkg -i hugo.deb

.PHONY: npm-install
npm-install:
	cd themes/docsy/
	git checkout tags/$(DOCSY_VERSION)
	npm install
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	npm install --save-dev autoprefixer
	npm install --save-dev postcss-cli
	npm install --save-dev postcss
