FROM ruby:3-slim

# throw errors if Gemfile has been modified since Gemfile.lock
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

ENTRYPOINT ruby ./main.rb
