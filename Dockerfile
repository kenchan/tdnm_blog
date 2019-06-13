FROM rubylang/ruby:2.6.3-bionic

RUN apt-get update && apt-get install -y --no-install-recommends g++ libmysqlclient-dev curl gnupg && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./

RUN bundle install --deployment

COPY ./ .
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
