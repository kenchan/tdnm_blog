source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'

gem 'administrate'
gem 'coffee-rails'
gem 'commonmarker'
gem 'font-awesome-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kaminari'
gem 'marked-rails'
gem 'meta-tags'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'sdoc', '~> 1.0.0', group: :doc
gem 'sitemap_generator'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'

group :development do
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'listen'
end
