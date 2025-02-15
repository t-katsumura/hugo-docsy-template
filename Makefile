
# See the package.json of the docsy to determine hugo version.
# https://github.com/google/docsy/blob/main/package.json
HUGO_VERSION:=0.136.2
DOCSY_VERSION:=v0.11.0

.PHONY: install-tools
install-tools:
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.deb
	sudo dpkg -i hugo.deb
	sudo snap install dart-sass

.PHONY: install-npm-packages
install-npm-packages:
	cd themes/docsy/
	git fetch --tags
	git checkout tags/$(DOCSY_VERSION)
	npm install
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	npm install --save-dev autoprefixer
	npm install --save-dev postcss-cli
	npm install --save-dev postcss
