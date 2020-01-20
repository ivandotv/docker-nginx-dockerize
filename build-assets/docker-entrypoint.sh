#!/bin/bash

#process main conf file
dockerize  -template /etc/nginx/nginx.conf:/etc/nginx/nginx.conf

#process default included conf.d directory
dockerize  -template /etc/nginx/conf.d:/etc/nginx/conf.d/

#process all files in custom template directory
if [[ -d /etc/nginx/custom.tmpl.d ]];then
    echo 'processing /etc/nginx/custom.tmpl.d'
    dockerize  -template /etc/nginx/custom.tmpl.d:/etc/nginx/custom.d/
fi

exec "$@"
