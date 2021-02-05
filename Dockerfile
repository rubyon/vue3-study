FROM ruby:3.0
LABEL maintainer "RubyOn <rubyon@me.com>"

ARG REFRESHED_AT
ENV REFRESHED_AT $REFRESHED_AT

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

WORKDIR /app

COPY Gemfile /app

RUN gem install bundler

RUN bundle install

COPY . /app

RUN yarn build

EXPOSE 80

CMD ["sh","start.sh"]
