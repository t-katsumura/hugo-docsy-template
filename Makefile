

HUGO_VERSION:=v0.125.7
DOCSY_VERSION:=v0.11.0

# 
# Usage:
#   make setup
.PHONY: setup
setup:
	# Install Hugo. https://gohugo.io/installation/linux/
	go install github.com/gohugoio/hugo@$(HUGO_VERSION)
	# Install docsy theme.
	# See https://www.docsy.dev/docs/get-started/other-options/
	git submodule add https://github.com/google/docsy.git themes/docsy
	echo "theme = 'docsy'" >> hugo.toml

.PHONY: npm-install
npm-install:
	cd themes/docsy/
	git checkout tags/$(DOCSY_VERSION)
	npm install
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	npm install --save-dev autoprefixer
	npm install --save-dev postcss-cli
	npm install --save-dev postcss
