#!/bin/bash

 curl --request GET \
  --url "https://api.spotify.com/v1/artists/$1/albums?include_groups=album&limit=20" \
  --header "Authorization: Bearer $access_token" > $1.json

