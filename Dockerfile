FROM ruby:2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /makgoradota2
WORKDIR /makgoradota2
ADD Gemfile /makgoradota2/Gemfile
ADD Gemfile.lock /makgoradota2/Gemfile.lock
RUN bundle install
ADD ./ /makgoradota2