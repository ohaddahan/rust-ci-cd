#!/bin/zsh
commit=$(git rev-parse --short HEAD)
#git log --branches master -n 1 --format=oneline --abbrev-commit  | awk '{print $1}'
name="rust-ci-cd-${commit}"
docker build --tag "${name}" --file Dockerfile . && printf "\n\nBuilt image: ${name}\n"