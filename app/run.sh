#!/bin/bash
bundle exec rake db:migrate RAILS_ENV=development
bundle exec rake db:seed
bundle exec puma -C config/puma.rb
