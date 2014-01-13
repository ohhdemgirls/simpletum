#!/bin/bash

basehost="$1"
id="$2"
wget="wget -nv"
apikey=$(cat api.key)
apiurl=$($wget -O - "http://api.tumblr.com/v2/blog/$basehost/posts?api_key=$apikey&id=$id&reblog_info=true")
source=$(./json.sh <<<"$apiurl" |grep -e '"reblogged_root_url"]' |sed 's.\\..g' |grep -Eo '\b(https?)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]' );clear
echo Source URL: $source
