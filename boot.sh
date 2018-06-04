#!/bin/sh
# this script is used to boot a Docker container
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Deploy command failed, retrying in 5 secs...
    sleep 5
done

exec python com-stouffcapital-ib.py
