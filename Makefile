

HUGO_VERSION:=v0.125.7
DOCSY_VERSION:=v0.11.0

# 
# Usage:
#   make setup
.PHONY: setup
setup:
	# Install HUGO extended version.
	# See https://gohugo.io/installation/linux/
	go install github.com/gohugoio/hugo@latest
	# Install docsy theme.
	# See https://www.docsy.dev/docs/get-started/other-options/
	git submodule add https://github.com/google/docsy.git themes/docsy
	echo "theme = 'docsy'" >> hugo.toml
	cd themes/docsy/
	git checkout v0.11.0
	npm install
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	npm install -g autoprefixer
	npm install -g postcss-cli
	npm install -g postcss
