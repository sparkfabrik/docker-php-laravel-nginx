# docker-php-nginx

NGINX Docker container for Laravel-based projects

This container works in pair with a PHP upstream server (such as https://github.com/sparkfabrik/docker-php-base-image) to proxy requests, serving static assets, if any.

## env variables

The entrypoint file contains a list of environment variables that will be replaced in all NGINX configuration files.

* `PHP_HOST`: the php host (default: `php`)
* `PHP_PORT`: the php port (default: `9000`)
* `NGINX_PHP_READ_TIMEOUT`: the php timeout (default: `900`)
* `NGINX_DEFAULT_SERVER_NAME`: the server name (default: `laravel`)
* `NGINX_DEFAULT_ROOT`: the server root (default: `/var/www/`)
* `NGINX_HTTPSREDIRECT`: enable/disable https redirect (default: `0`)
* `NGINX_SUBFOLDER`: include nginx configuration files from subfolders (default: `0`)
* `NGINX_SUBFOLDER_ESCAPED`: (default: `0`)
* `NGINX_OSB_BUCKET`: needed when using s3fs to store static assets; contains the remote bucket URL to proxy aggregated ccs/js relative urls
* `NGINX_OSB_RESOLVER`: needed when using s3fs to store static assets; contains the host resolver that nginx uses to resolve the remote bucket url (default: `8.8.8.8`)
* `PUBLIC_FILES_PATH`: the path for Laravel's public files storage (default: `storage/app/public`)
* `NGINX_CACHE_CONTROL_HEADER`: caching policy for public files (default: `public,max-age=3600`)
