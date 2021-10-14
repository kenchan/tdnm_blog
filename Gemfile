source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 7.0.0.alpha2'

gem 'administrate'
gem 'commonmarker'
gem 'graphql'
gem 'jbuilder'
gem 'kaminari'
gem 'marked-rails'
gem 'meta-tags'
gem 'mysql2'
gem 'puma'
gem 'sass-rails'
gem 'sdoc', '~> 1.0.0', group: :doc
gem 'sitemap_generator'
gem 'slim-rails'
gem 'uglifier'
gem 'turbo-rails'

group :production do
  gem 'lograge'
  gem 'rails_12factor'
  gem 'stackdriver'
end

group :development do
  gem 'graphiql-rails'
  gem 'rbs_rails', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'listen'
  gem 'pry-rails'
  gem 'selenium-webdriver'
end
