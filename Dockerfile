FROM ruby:3.3-slim

# install imagemagick tool for convert command
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev \
        libtiff-dev \
        imagemagick \
    && rm -rf /var/lib/apt/lists/*

# install jekyll and bundler
RUN export GEM_HOME="$HOME/gems" \
    && export PATH="$HOME/gems/bin:$PATH" \
    && gem install jekyll -v '4.3' \
    && gem install bundler -v '2.5.0'

ENV GEM_HOME="/usr/local/bundle"
ENV PATH=$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

WORKDIR /srv/jekyll

COPY Gemfile ./

RUN bundle install

COPY . ./

ENTRYPOINT [ "bundler", "exec", "jekyll" ]
