function check_slugs() {
    duplicate_slugs=$(jq -r ".[\"$1\"][].slug" config.json | sort | uniq -d)
    if [ -n "$duplicate_slugs" ]; then
        echo "\033[0;31mThe following $1 slugs are not unique:\033[0m"
        echo "$duplicate_slugs"
        exit 1
    fi
}

check_slugs posts
check_slugs stories
