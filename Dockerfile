FROM nginx:alpine

# RUN set -x ; \
#  addgroup -g 82 -S www-data ; \
#  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

ENV HOME /home/www-data

COPY profile $HOME/.profile
ENV ENV $HOME/.profile

RUN addgroup -g 1000 www-data && adduser -u 1000 -h /home/app -s /bin/sh -D -G www-data www-data && \
  touch /var/run/nginx.pid && \
  chown -R www-data:www-data /var/run/nginx.pid && \
  chown -R www-data:www-data /var/cache/nginx


USER www-data

CMD ["nginx", "-g", "daemon off;"]
