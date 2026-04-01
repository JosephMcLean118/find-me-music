#! /bin/bash
# Pick a random genre, then get top 50 albums of that genre, then pick one of the 50.
#
# primaryGenreName is what we want to queryBy.
# We want to find 50 top albums of some genre
output=$(curl -s https://itunes.apple.com/search?term=Rock&media=music&entity=album&limit=200)

albumName=$(echo "$output" | jq -r '.results[] | select(.collectionName != null) | .collectionName')
echo "$output" | jq 'keys'       # Shows top-level keys
echo "$output" | jq '.resultCount'  # How many results?
echo "$albumName"
exit 1
