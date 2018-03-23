#!/bin/sh
set -u

if [ -z "${LOGWATCH_FILE+x}" ]; then
    echo "LOGWATCH_FILE not set" 1>&2
    exit 1
fi

while true; do
    if [ ! -e "${LOGWATCH_FILE}" ]; then
        touch "${LOGWATCH_FILE}"
    fi

    chmod a+rw "${LOGWATCH_FILE}"
    echo "Watching ${LOGWATCH_FILE}"

    tail -n+1 --follow=name "$LOGWATCH_FILE"
    sleep 1
done
