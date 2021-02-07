FROM ruby:3.0-alpine
LABEL maintainer "RubyOn <rubyon@me.com>"

RUN apk update && apk upgrade

RUN apk add build-base nodejs yarn mariadb-dev

RUN gem install bundler

WORKDIR /app

COPY Gemfile /app

RUN bundle install

COPY . /app

RUN rm -rf config/database.rb && cp app/db/production_database.rb app/config/database.rb

RUN yarn build

EXPOSE 80

CMD ["sh","start.sh"]
