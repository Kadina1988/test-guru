#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rake RAILS_ENV=production db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rails db:check_protected_environments
# bundle exec rails db:setup
# bundle exec rails db:seed

