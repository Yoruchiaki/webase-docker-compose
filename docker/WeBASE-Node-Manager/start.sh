#!/bin/bash
ping node-mysql
cd /dist/script && bash /dist/script/webase.sh
log_file=/dist/log/WeBASE-Sign.log
if [ ! -f "${log_file}" ]; then
    touch "${log_file}"
fi
cd /dist/ && java ${JAVA_OPTS} -Djdk.tls.namedGroups="secp256k1", -Duser.timezone="Asia/Shanghai" -Djava.security.egd=file:/dev/./urandom, -Djava.library.path=/dist/conf -cp ${CLASSPATH}  ${APP_MAIN}