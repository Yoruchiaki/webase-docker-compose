FROM webasepro/webase-node-mgr:v1.5.4
RUN sed -i "s@http://.*ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list && \
    apt-get update && \
    sh -c 'echo "deb http://launchpad.proxy.ustclug.org/ansible/ansible/ubuntu bionic main" >> /etc/apt/sources.list' && \
    apt-get install rsync ansible openssh-client -y
ENV DB_HOST=127.0.0.1
ENV DB_DATABASE=database
ENV DB_PORT=3306
ENV DB_USERNAME=username
ENV DB_PASSWORD=password
ENV NODE_HOST=node
RUN sed -i 's/"webasenodemanager"/\${DB_DATABASE}/g' script/webase.sh && \
    sed -i 's/"defaultAccount"/\${DB_USERNAME}/g' script/webase.sh && \
    sed -i 's/"defaultPassword"/\${DB_PASSWORD}/g' script/webase.sh && \
    sed -i "s/\${1}/\${DB_HOST}/g" script/webase.sh && \
    sed -i "s/\${2}/\${DB_PORT}/g" script/webase.sh && \
    sed -i "s/sudo//g" script/webase.sh
RUN sed -i "s/127.0.0.1:5004/\${NODE_HOST}/g" conf/application.yml && \
    sed -i "s/127.0.0.1/\${DB_HOST}/g" conf/application.yml && \
    sed -i "s/3306/\${DB_PORT}/g" conf/application.yml && \
    sed -i "s/webasenodemanager/\${DB_DATABASE}/g" conf/application.yml && \
    sed -i "s/defaultAccount/\${DB_USERNAME}/g" conf/application.yml && \
    sed -i "s/defaultPassword/\${DB_PASSWORD}/g" conf/application.yml && \
    sed -i "s/deployType: 0/deployType: 1/g" conf/application.yml
VOLUME ["/dist/logs","/etc/ansible/hosts"]
ADD ./start.sh /
RUN chmod a+x /start.sh
ADD .ssh /root/.ssh/
ENTRYPOINT ["/start.sh"]
