# docker build -t clevertechru/docker-solar .
FROM ubuntu:14.04
FROM ruby:2.2.5
MAINTAINER master@clevertech.ru

RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    wget \
    git-core \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    libpq-dev \
    ffmpegthumbnailer \
  && rm -rf /var/lib/apt/lists/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
ENV RAILS_ENV=development
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./
COPY ./config/database.docker.yml ./config/database.yml
COPY ./config/secrets.docker.yml  ./config/secrets.yml

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]