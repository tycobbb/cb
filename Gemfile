# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) do |repo|
  "https://github.com/#{repo}.git"
end

ruby "2.5.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker", ">= 4.0.x"

group :development do
  gem "spring"
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "awesome_print"
  gem "dotenv-rails"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem "rubocop"
end

group :test do
  gem "minitest-reporters"
end
