#!/bin/bash

set -eo pipefail


# if set env for MySQL JDBC Driver, create database.conf
if [ "$MYSQL_DB_URL" -a "$MYSQL_DB_USER" -a "$MYSQL_DB_PASSWORD" ]; then
    cat <<__EOF__ >/gitbucket/database.conf
db {
    url      = "$MYSQL_DB_URL"
    user     = "$MYSQL_DB_USER"
    password = "$MYSQL_DB_PASSWORD"
}
__EOF__
fi


JAVA_CMD="java ${JAVA_VM_OPTS} -jar /opt/gitbucket.war"

# if command starts with an option, prepend java command
if [ "${1:0:1}" = '-' ]; then
    set -- ${JAVA_CMD} $@
fi

exec "$@"
