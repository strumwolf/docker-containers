#!/bin/bash
chown -R couchpotato /config
exec /sbin/setuser couchpotato python /opt/couchpotato/CouchPotato.py --data_dir /config
