#!/bin/bash

# Parse JSON file and extract album information using jq
json_file="$1.json"

# Extract information for each album
jq -r '.items[] | "\(.id | @sh), \(.name | @sh), TO_DATE(\(.release_date | @sh), '\''YYYY-MM-DD'\''),  \(.artists[0].id | @sh)"' "$json_file" |
while read -r album_info; do
    # Extracted information for each album
    echo "INTO Album (Id_Album, Titulo, Fe_publicacion, Id_artista)"
    echo "VALUES ($album_info)"
done
