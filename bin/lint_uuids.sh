duplicate_uuids=$(jq -r '.. | .uuid? | select(. != null)' config.json | sort | uniq -d)
if [ -n "$duplicate_uuids" ]; then
    echo "\033[0;31mThe following UUIDs are not unique:\033[0m"
    echo "$duplicate_uuids"
    exit 1
fi
