FROM ruby:2.4

RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client nodejs && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/app
COPY Gemfile* ./
RUN bundle install --path vendor/bundle
COPY ./ .
RUN bundle exec rake assets:precompile

RUN cp -r /srv/app/public /var/www

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
