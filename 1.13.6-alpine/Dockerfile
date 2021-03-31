FROM nginx:1.13.6-alpine

ARG user=root
ARG group=root

COPY --chown=$user:$group docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && \
    chown -R $user:$group /etc/nginx && \
    chown -R $user:$group /var/cache/nginx && \
    chown -R $user:$group /var/log/nginx && \
    mkdir /var/run/nginx && \
    chown -R $user:$group /var/run/nginx && \
    sed -i 's|/var/run/nginx.pid|/var/run/nginx/nginx.pid|g' /etc/nginx/nginx.conf

COPY --chown=$user:$group templates /templates

# Go to target user
USER $user

ENTRYPOINT [ "/docker-entrypoint.sh" ]
