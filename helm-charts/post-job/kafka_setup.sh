#!/bin/bash
es_ip=$1
es_dir=$(dirname $(readlink -f $0))
curl -XPOST -H 'content-type:application/json' ${es_ip}:9082/connectors -d@${es_dir}/enrichment.json

