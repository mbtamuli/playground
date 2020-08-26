#!/bin/bash

# Edit the GITLAB_TOKEN, GITLAB_BASE and "group/project" inside GRAPHQL_QUERY

GITLAB_TOKEN='PRIVATE_TOKEN'
GITLAB_BASE_URL='https://example.gitlab.com'
GRAPHQL_QUERY='{
    "query": "query {
        group(fullPath: \"group/project\") {
            projects {
                nodes {
                    name
                    sshUrlToRepo
                }
            }
        }
    }"
}'
repo_list=$(curl \
    --header "Authorization: Bearer ${GITLAB_TOKEN}" \
    --header "Content-Type: application/json" \
    --request POST \
    --data @- \
    "${GITLAB_BASE_URL}/api/graphql" <<< "$GRAPHQL_QUERY" | jq -r '.data.group.projects.nodes[] | "\(.name),\(.sshUrlToRepo)"')
while IFS= read -r line; do
    name="$(echo $line | cut -d',' -f1)"
    url="$(echo $line | cut -d',' -f2)"
    echo "Cloning $name"
    git clone $url
done <<< "$repo_list"