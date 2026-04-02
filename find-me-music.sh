#! /bin/bash
# Pick a random genre, then get top 50 albums of that genre, then pick one of the 50.
#

# Load in API Keys
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

genres=("Rock" "Disco" "Jazz" "Pop" "Folk" "Electronic" "Punk" "Hip-Hop")
random_genre=$(shuf -e "${genres[@]}" -n 1)
random_number=$((RANDOM % 50))

# Get first album returned from API
output=$(curl -s "http://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=$random_genre&api_key=$LASTFM_API_KEY&format=json&limit=50" | jq -r '.albums.album[0]')


# Want to add feature so users can pass in genre if they want, otherwise it randomly picks one, also ened to add helpstring
album_name=$(echo "$output" | jq -r '.name')
artist_name=$(echo "$output" | jq -r '.artist.name')

echo "-------------------------"
echo "FIND-ME-MUSIC" 
echo $(date '+%Y-%m-%d')
echo "Album Name: $album_name"
echo "Artist Name: $artist_name"
echo "-------------------------"
exit 1
