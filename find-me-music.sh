#! /bin/bash
# Get the album name and name of artist for a random album

# Load in API Keys
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Set genres and pick a random genre
genres=("Rock" "Disco" "Jazz" "Pop" "Folk" "Electronic" "Punk" "Hip-Hop")
random_genre=$(shuf -e "${genres[@]}" -n 1)

# Get random album of 50 returned from API
output=$(curl -s "http://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=$random_genre&api_key=$LASTFM_API_KEY&format=json&limit=50" \
  | jq -r --argjson idx $((RANDOM % 50)) '.albums.album[$idx]')

# Parse album name and artist name from album
album_name=$(echo "$output" | jq -r '.name')
artist_name=$(echo "$output" | jq -r '.artist.name')

echo "-------------------------"
echo "FIND-ME-MUSIC" 
echo $(date '+%Y-%m-%d')
echo "Album Name: $album_name"
echo "Artist Name: $artist_name"
echo "-------------------------"
exit 1
