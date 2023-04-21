#!/bin/bash
bash /sign/dist/start.sh
log_file=/sign/dist/log/WeBASE-Sign.log
if [ ! -f "${log_file}" ]; then
    touch "${log_file}"
fi
tail -f /sign/dist/log/WeBASE-Sign.log
