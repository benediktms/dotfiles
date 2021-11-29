#!/bin/bash

gitrepo=$1
regex=':(.*)\/(.*).git'
[[ "$gitrepo" =~ $regex ]]
owner=${BASH_REMATCH[1]}
repo=${BASH_REMATCH[2]}

gh api graphql -F owner=$owner -F name=$repo -f query='
  query($name: String!, $owner: String!) {
    repository(owner: $owner, name: $name) {
      collaborators {
        nodes { login }
      }
    }
  }
' --template \
'{{ range $key, $value := .data.repository.collaborators.nodes -}}
{{ $value.login }}
{{ end -}}' | cat
