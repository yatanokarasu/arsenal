#!/bin/bash

set -eo pipefail


JAVA_CMD="java ${JAVA_VM_OPTS} -jar /opt/rundeck/rundeck.jar"

# if command starts with an option, prepend java command
if [ "${1:0:1}" = '-' ]; then
    set -- ${JAVA_CMD} $@
fi

exec "$@"
