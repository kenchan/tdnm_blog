FROM rubylang/ruby:2.7.5-bionic

RUN apt-get update -q && apt-get install -y --no-install-recommends -q \
    g++ \
    libpq-dev \
    wait-for-it \
    automake \
    libtool \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get update -q && apt-get install -y --no-install-recommends -q nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
WORKDIR /app

RUN bundle config set path /app/vendor/bundle
