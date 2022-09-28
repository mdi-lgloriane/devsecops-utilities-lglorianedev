#!/bin/bash

# Instruction to execute: sh AllUserStoriesInCurrentSprint.sh <jira_domain>
# i.e. $ sh AllUserStoriesInCurrentSprint.sh mdi-ap-devsecops-lglorianedev

source credentials.properties

main() {
curl --request POST \
  --url "https://$1.atlassian.net/rest/api/3/filter" \
  --user "$jira_username:$jira_token" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "jql": "Sprint in openSprints() AND Sprint not in futureSprints() and type = Story and project = DevSecOps",
    "name": "AllUserStoriesInCurrentSprint",
    "description": "Lists all the user stories in the current sprint"
  }'

}

main $1
