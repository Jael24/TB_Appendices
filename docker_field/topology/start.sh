#!/bin/sh

set -ex

docker-compose up --build -d
docker-compose run metricbeat \
	       metricbeat setup --index-management \
	       -E output.logstash.enabled=false \
	       -E 'output.elasticsearch.hosts=["172.17.0.1:9200"]'
docker-compose logs -f
