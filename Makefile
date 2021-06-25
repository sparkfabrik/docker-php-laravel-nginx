TAGS := 1.13.6-alpine 1.21.0-alpine

all: build test build-rootless test-rootless

build:
	@for tag in $(TAGS); do \
		echo Build image for tag: $$tag; \
		docker build -t sparkfabrik/docker-php-laravel-nginx:$$tag --build-arg user=root $$tag; \
	done

test:
	@for tag in $(TAGS); do \
		echo Test image for tag: $$tag; \
		export NGINX_VERSION="$${tag%-alpine}"; \
		./tests/image_verify.sh --source tests/expectations --env-file tests/envfile --http-port 80 --user root sparkfabrik/docker-php-laravel-nginx:$$tag; \
		./tests/image_verify.sh --source tests/overrides/expectations --env-file tests/overrides/envfile --http-port 4321 --http-host nginx_default_server_name --user root sparkfabrik/docker-php-laravel-nginx:$$tag; \
	done

build-rootless:
	@for tag in $(TAGS); do \
		echo Build image for tag: $$tag in rootless flavour; \
		docker build -t sparkfabrik/docker-php-laravel-nginx:$$tag-rootless --build-arg user=1001 $$tag; \
	done

test-rootless:
	@for tag in $(TAGS); do \
		echo Test image for tag: $$tag in rootless flavour; \
		export NGINX_VERSION="$${tag%-alpine}"; \
		./tests/image_verify.sh --source tests/expectations --env-file tests/envfile --http-port 8080 --user "unknown uid 1001" sparkfabrik/docker-php-laravel-nginx:$$tag-rootless; \
		./tests/image_verify.sh --source tests/overrides/expectations --env-file tests/overrides/envfile --http-port 4321 --http-host nginx_default_server_name --user "unknown uid 1001" sparkfabrik/docker-php-laravel-nginx:$$tag-rootless; \
	done
