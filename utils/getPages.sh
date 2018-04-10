#!/bin/bash

# ================================================================================
url_base="https://demo.magnolia-cms.com/.rest/"
endpoint="nodes/"
version="v1"
repository="/website"
params="?includeMetadata=true&depth=1"

user="superuser"
pass="superuser"

json_output="website.json"
# ================================================================================

function getChildPages()
{
    path=$1
    curl -s -X GET "${url_base}${endpoint}${version}${repository}${path}${params}" -u ${user}:${pass} > ${json_output}
    pages=($(jq -r '.nodes[] | select(.type=="mgnl:page") | .path' ${json_output}))

    for page in "${pages[@]}"
    do
        if [[ "$page" =~ [a-zA-Z] ]]; then
            echo "$page"
            getChildPages $page
        fi
    done
}

getChildPages "/"
