all: build test build-rootless test-rootless

build:
	docker build -t sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine --build-arg user=root 1.13.6-alpine

test:
	./tests/image_verify.sh --source tests/expectations --env-file tests/envfile --http-port 80 --user root sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine
	./tests/image_verify.sh --source tests/overrides/expectations --env-file tests/overrides/envfile --http-port 4321 --http-host nginx_default_server_name --user root sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine

build-rootless:
	docker build -t sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine-rootless --build-arg user=1001 1.13.6-alpine

test-rootless:
	./tests/image_verify.sh --source tests/expectations --env-file tests/envfile --http-port 8080 --user "unknown uid 1001" sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine-rootless
	./tests/image_verify.sh --source tests/overrides/expectations --env-file tests/overrides/envfile --http-port 4321 --http-host nginx_default_server_name --user "unknown uid 1001" sparkfabrik/docker-php-laravel-nginx:1.13.6-alpine-rootless
