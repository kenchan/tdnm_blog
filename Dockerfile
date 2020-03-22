FROM rubylang/ruby:2.7.0-bionic

RUN apt-get update -q && apt-get install -y --no-install-recommends -q \
    g++ \
    libmysqlclient-dev \
    curl \
    gnupg \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update -q && apt-get install -y --no-install-recommends -q nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile* ./

RUN bundle config set deployment
RUN bundle install

COPY ./ .
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
