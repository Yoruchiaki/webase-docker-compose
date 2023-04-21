FROM webasepro/webase-web:v1.5.4
RUN mkdir -p /usr/share/nginx/log/ && \
    touch /usr/share/nginx/log/error.log &&  \
    chmod 755 /usr/share/nginx/log/error.log
COPY nginx.conf /data/webase-web/nginx/
