source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.1'

gem 'administrate'
gem 'coffee-rails'
gem 'commonmarker'
gem 'falcon'
gem 'font-awesome-rails'
gem 'graphql'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kaminari'
gem 'marked-rails'
gem 'meta-tags'
gem 'pg'
gem 'sass-rails'
gem 'sdoc', '~> 1.0.0', group: :doc
gem 'sitemap_generator'
gem 'slim-rails'
gem 'uglifier'

group :production do
  gem 'rails_12factor'
  gem 'sqreen'
end

group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
  gem 'listen'
end

gem 'graphiql-rails', group: :development