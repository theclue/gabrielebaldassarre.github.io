.PHONY: build knitr dev

ROOT_DIR		:= $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
JEKYLL_VERSION	:= 4.2

build:
	@docker run --rm -v $(ROOT_DIR):/srv/jekyll -e JEKYLL_ENV=production -e JEKYLL_ENV=development gabrielebaldassarre/blog:latest bash -c 'chown jekyll:jekyll -R /usr/gem && bundle && bundle exec jekyll build --destination docs/'

knitr:
	@Rscript R/build_blog.R

dev:
	docker build --tag gabrielebaldassarre/blog:$(JEKYLL_VERSION) --build-arg JEKYLL_VERSION=$(JEKYLL_VERSION) .
	docker run --rm -v $(ROOT_DIR):/srv/jekyll -p 35729:35729 -p 4000:4000 -e JEKYLL_ENV=development -it gabrielebaldassarre/blog:latest bash -c 'chown jekyll:jekyll -R /usr/gem && bundle && bundle exec jekyll serve --draft --host 0.0.0.0 --force_polling'
