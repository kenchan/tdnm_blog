FROM ruby:2.6.0-alpine3.7

RUN apk --no-cache add tzdata nodejs postgresql-dev icu-dev
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /srv/app
COPY Gemfile* ./

RUN apk --no-cache --virtual=.rails_deps add git g++ make cmake \
  && bundle install --deployment \
  && apk del .rails_deps

COPY ./ .
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
