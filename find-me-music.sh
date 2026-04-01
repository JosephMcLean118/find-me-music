#! /bin/bash
# Pick a random genre, then get top 50 albums of that genre, then pick one of the 50.
#

# Load in API Keys
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi


# Test Query to make sure API Works
genre="Rock"
output=$(curl -s "http://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=$genre&api_key=$LASTFM_API_KEY&format=json&limit=50")

exit 1
