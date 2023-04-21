FROM webasepro/webase-sign:v1.5.3
RUN sed -i "s/127.0.0.1/\${DB_HOST}/g" conf/application.yml && \
    sed -i "s/3306/\${DB_PORT}/g" conf/application.yml && \
    sed -i 's/"dbUsername"/\${DB_USERNAME}/g' conf/application.yml && \
    sed -i 's/"dbPassword"/\${DB_PASSWORD}/g' conf/application.yml && \
    sed -i "s/webasesign/\${DB_DATABASE}/g" conf/application.yml