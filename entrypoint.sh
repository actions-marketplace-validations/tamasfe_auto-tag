#!/bin/sh

# Partially based on https://github.com/rickstaa/action-create-tag

set -eu

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

cd "${GITHUB_WORKSPACE}" || exit

GIT_USER_NAME="${GITHUB_ACTOR}"
GIT_USER_EMAIL="${GITHUB_ACTOR}@users.noreply.github.com"

git config user.name "${GIT_USER_NAME}"
git config user.email "${GIT_USER_EMAIL}"

eval "auto-tag --commit $GITHUB_SHA --git-user-name $GIT_USER_NAME --git-user-email $GIT_USER_EMAIL $INPUT_PATHS"

git push --tags
