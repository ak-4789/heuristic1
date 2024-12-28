#! /bin/bash

echo  "======================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.sh

git add -A && git commit -m "updated feed"
git push --set-upstream origin docker-py

echo  "======================="