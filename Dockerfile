FROM kyma/docker-nginx

# Swap the default server file.
# COPY ./nginx.conf /etc/nginx/sites-enabled/default

COPY static/ /var/www

# EXPOSE 8088

CMD 'nginx'
