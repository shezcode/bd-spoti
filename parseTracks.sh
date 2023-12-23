#!/bin/bash

# Parse JSON file and extract track information using jq
json_file="tracks$1.json"

# Extract information for each track
jq -r '.tracks.items[] | "\(.id | @sh), \(.name | @sh), \(.duration_ms), \(.artists[0].id | @sh)"' "$json_file" |
while read -r track_info; do
    # Extracted information for each track
    track_info=$(echo "$track_info" | sed "s/\\\'//g")

    # sql insert command
    echo "INTO cancion (Id_Cancion, Titulo, Duracion, Id_Artista, Id_Album)" 
    echo "VALUES ($track_info, '$1')" 

done


