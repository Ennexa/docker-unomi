#!/bin/sh
wget https://www-us.apache.org/dist/incubator/unomi/1.2.0-incubating/unomi-1.2.0-incubating.tar.gz
tar zxvf unomi-1.2.0-incubating.tar.gz
ls -lR
mv unomi-1.2.0-incubating unomi
wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
gunzip GeoLite2-City.mmdb.gz
wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz
gunzip GeoLite2-Country.mmdb.gz
cp GeoLite2-City.mmdb GeoLite2-Country.mmdb unomi/etc
echo cluster.name=dockerContextElasticSearch > unomi/etc/org.oasis_open.contextserver.persistence.elasticsearch.cfg
echo index.name=context >> unomi/etc/org.oasis_open.contextserver.persistence.elasticsearch.cfg
echo elasticSearchConfig=file:\${karaf.etc}/elasticsearch.yml >> unomi/etc/org.oasis_open.contextserver.persistence.elasticsearch.cfg
