#! /bin/bash

SUCCESS=`tput setaf 2`
FAILED='tput setaf 1'

branch_name=${1:-dev}

echo "Checking if branch exists on remote origin..."
existed_in_remote=$(git ls-remote --heads origin ${branch_name})

if [ ! "$existed_in_remote" ]; then
    echo "❌ ${FAILED}Error: Branch doesn't exist on remote"
else
    echo "✅ ${GREEN}Branch exists on remote, now pushing code to ${branch_name}"
    $(git push origin ${branch_name})
fi

echo "Here is the last commit from git log:"
echo -e
git log --pretty=oneline --abbrev-commit --graph --decorate --all