exit_code=0

for thumbnail_url in $(jq -r '.stories[] | .thumbnail_url' config.json); do
    curl --head --silent --fail "${thumbnail_url}" 2>&1 1> /dev/null
    if [ $? -ne 0 ]; then
       echo -e "\033[0;31mThe image at ${thumbnail_url} is missing\033[0m"
       exit_code=1
    fi
done

exit $exit_code