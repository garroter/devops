#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 3 ]; then
	echo "Usage: $0 <Source_Repo_URL> <Target_Repo_URL> <Branch_Name>"
	exit 1
fi

# Set source repository URL from first argument
SOURCE_REPO_URL="$1"

# Set target repository URL from second argument
TARGET_REPO_URL="$2"

# Set branch name from third argument
BRANCH_NAME="$3"

# Clone source repository
git clone --mirror "$SOURCE_REPO_URL" temp_repo

# Change directory to cloned repository
cd temp_repo || exit

# Push mirrored repository to target
git push --mirror "$TARGET_REPO_URL"

# Push specific branch to target
git push "$TARGET_REPO_URL" "$BRANCH_NAME"

# Push tags to target
git push --tags "$TARGET_REPO_URL"

# Clean up temporary repository
cd .. || exit
rm -rf temp_repo

echo "Repository successfully migrated from Source to Target."
