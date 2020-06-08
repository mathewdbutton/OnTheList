#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

npm install -g yarn

echo "Installing npm modules"
yarn check --verify-tree || yarn install

echo "Installing gems"
bundle check || bundle install

echo "Setting up databases"
bundle exec rails db:exists && bundle exec rails db:migrate || bundle exec rails db:setup

echo "precompiling assets"
bundle exec rails assets:precompile

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
