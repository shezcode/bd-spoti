#!/bin/bash

curl --request GET \
  --url https://api.spotify.com/v1/albums/$1 \
  --header "Authorization: Bearer $access_token" > tracks$1.json
