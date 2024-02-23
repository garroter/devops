#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <GitLab_Repo_URL> <Bitbucket_Repo_URL>"
	exit 1
fi

# Set GitLab repository URL from first argument
GITLAB_REPO_URL="$1"

# Set Bitbucket repository URL from second argument
BITBUCKET_REPO_URL="$2"

# Clone GitLab repository
git clone --mirror "$GITLAB_REPO_URL" temp_repo

# Change directory to cloned repository
cd temp_repo || exit

# Push mirrored repository to Bitbucket
git push --mirror "$BITBUCKET_REPO_URL"

# Push tags to Bitbucket
git push --tags "$BITBUCKET_REPO_URL"

# Clean up temporary repository
cd .. || exit
rm -rf temp_repo

echo "Repository successfully migrated from GitLab to Bitbucket."
