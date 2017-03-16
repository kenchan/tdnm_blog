FROM ruby:2.4-alpine

RUN apk --no-cache add git g++ make postgresql-dev nodejs

WORKDIR /srv/app
COPY Gemfile* ./
RUN bundle install --path vendor/bundle
COPY ./ .
RUN bundle exec rake assets:precompile

RUN cp -r /srv/app/public /var/www

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
