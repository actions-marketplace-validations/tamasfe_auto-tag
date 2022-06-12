#!/bin/sh

# Partially based on https://github.com/rickstaa/action-create-tag

set -eu

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

cd "${GITHUB_WORKSPACE}" || exit

GIT_USER_NAME=${INPUT_NAME:-${GITHUB_ACTOR}}
GIT_USER_EMAIL=${INPUT_EMAIL:-"${GIT_USER_NAME}@users.noreply.github.com"}

git config user.name "${GIT_USER_NAME}"
git config user.email "${GIT_USER_EMAIL}"

if [ -n "${INPUT_TOKEN}" ]; then
    git remote set-url origin "https://${GITHUB_ACTOR}:${INPUT_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
fi

eval "auto-tag --git-user-name $GIT_USER_NAME --git-user-email $GIT_USER_EMAIL $INPUT_PATHS"

git push --tags
