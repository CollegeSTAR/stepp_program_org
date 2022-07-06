# syntax=docker/dockerfile:1

FROM ruby:3.1.2-bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq

RUN apt-get install -yqq \
  nodejs

WORKDIR /usr/src/app

RUN gem install bundler

COPY Gemfile* .

RUN bundle install
RUN bundle add webrick

COPY . .

RUN bundle exec bourbon install --path /usr/src/app/_sass/

CMD ["bash"]
