FROM rubylang/ruby:2.7.0-bionic

RUN apt-get update -q && apt-get install -y --no-install-recommends -q \
    g++ \
    libmysqlclient-dev \
    curl \
    gnupg \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get update -q && apt-get install -y --no-install-recommends -q nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN bundle config jobs 3
RUN bundle config path ./vendor/bundle
