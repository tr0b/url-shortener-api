FROM ruby:3.2.1

WORKDIR /usr/src/app

COPY . .
RUN bundle install
