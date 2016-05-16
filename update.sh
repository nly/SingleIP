#!/bin/sh

DATE=$(date +%Y%m%d)

wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
gzip -d GeoLite2-City.mmdb.gz -c > GeoLite2-City.mmdb.${DATE}
rm -rf GeoLite2-City.mmdb.gz GeoLite2-City.mmdb
ln -s GeoLite2-City.mmdb.${DATE} GeoLite2-City.mmdb