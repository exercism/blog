duplicate_slugs=$(jq -r '.. | .slug?' config.json | sort | uniq -d)
if [ -n "$duplicate_slugs" ]; then
    echo "\033[0;31mThe following slugs are not unique:\033[0m"
    echo "$duplicate_slugs"
    exit 1
fi
