
# GitLab to Bitbucket Repository Migration Script

## Description
This Bash script facilitates the migration of a GitLab repository to Bitbucket. It clones the GitLab repository, then pushes the mirrored repository along with its tags to the specified Bitbucket repository URL.

## Prerequisites
- Git installed on the system.
- Access to both GitLab and Bitbucket repositories.
- Proper authentication configured for both repositories if required.

## Usage
```bash
./clone_repo.sh <GitLab_Repo_URL> <Bitbucket_Repo_URL>
