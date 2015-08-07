#!/bin/bash
chown -R sickbeard /config
exec /sbin/setuser sickbeard python /opt/sickbeard/SickBeard.py --datadir=/config
