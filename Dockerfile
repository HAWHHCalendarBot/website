FROM docker.io/library/nginx:1-alpine
RUN apk --no-cache upgrade

WORKDIR /usr/share/nginx/html
EXPOSE 80
VOLUME /calendars

COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s#types {#types {\n\ttext/calendar\tics;#g" /etc/nginx/mime.types
RUN nginx -t

RUN ln -s /calendars tg

COPY html ./
