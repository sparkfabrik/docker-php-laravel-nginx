FROM nginx:1.13.6-alpine

ARG user=root

COPY --chown=$user:$user docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && \
    chown -R $user:$user /etc/nginx && \
    chown -R $user:$user /var/cache/nginx && \
    chown -R $user:$user /var/log/nginx && \
    mkdir /var/run/nginx && \
    chown -R $user:$user /var/run/nginx && \
    sed -i 's|/var/run/nginx.pid|/var/run/nginx/nginx.pid|g' /etc/nginx/nginx.conf

COPY --chown=$user:$user templates /templates

# Go to target user
USER $user

ENTRYPOINT [ "/docker-entrypoint.sh" ]
