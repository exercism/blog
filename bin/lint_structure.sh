exit_code=0

for post_slug in $(jq -r '.posts[].slug' config.json | sort); do
    post_markdown_file="./posts/${post_slug}.md"
    if [ ! -f ${post_markdown_file} ]; then
        echo "\033[0;31mMissing markdown file '${post_markdown_file}' for post '${post_slug}'\033[0m"
        exit_code=1
    fi    
done

for story_slug in $(jq -r '.stories[].slug' config.json | sort); do
    story_markdown_file="./stories/${story_slug}.md"
    if [ ! -f ${story_markdown_file} ]; then
        echo "\033[0;31mMissing markdown file '${story_markdown_file}' for story '${story_slug}'\033[0m"
        exit_code=1
    fi    
done

exit $exit_code
