all: build build-rootless

build:
	docker build -t sparkfabik/docker-php-laravel-nginx:1.13.6-alpine --build-arg user=root 1.13.6-alpine

build-rootless:
	docker build -t sparkfabik/docker-php-laravel-nginx:1.13.6-alpine-rootless --build-arg user=nginx 1.13.6-alpine
