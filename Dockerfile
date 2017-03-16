FROM ruby:2.4-alpine

RUN apk --no-cache add tzdata nodejs postgresql-dev
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /srv/app
COPY Gemfile* ./

RUN apk --no-cache --virtual=.rails_deps add git g++ make \
  && bundle install --deployment \
  && apk del .rails_deps

COPY ./ .
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
