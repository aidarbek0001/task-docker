FROM alpine:3.14

RUN apk update && apk upgrade
RUN apk add bash nginx php7 php7-fpm php7-opcache php7-gd php7-zlib php7-curl

COPY nginx /etc/nginx
COPY php /etc/php7
COPY index.php /usr/share/nginx/html/

RUN mkdir /var/run/php

EXPOSE 80

CMD ["/bin/bash", "-c", "php-fpm7 && chmod 777 /var/run/php/php7-fpm.sock && chmod 755 /usr/share/nginx/html/* && nginx -g 'daemon off;'"]
