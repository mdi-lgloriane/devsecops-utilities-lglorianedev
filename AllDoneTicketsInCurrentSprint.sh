#!/bin/bash

# Instruction to execute: sh add_issue_type_code_review.sh <jira_domain>
# i.e. $ sh add_issue_type_code_review.sh mdi-ap-devsecops-lglorianedev

source credentials.properties

main() {
curl --request POST \
  --url "https://$1.atlassian.net/rest/api/3/filter" \
  --user "$jira_username:$jira_token" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
  "jql": "Sprint in openSprints() AND Sprint not in futureSprints() and status in (Done) AND project = DevSecOps",
  "name": "AllDoneTicketsInCurrentSprint",
  "description": "Lists all done tickets in current sprint"
}'
}

main $1
