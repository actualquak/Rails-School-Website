FROM ruby:2.5.5 AS rails-toolbox

RUN apt-get update -yqq
RUN apt-get install -y nodejs postgresql apache2 build-essential npm
RUN npm install --global yarn

WORKDIR /app

COPY ./Gemfile* ./
COPY ./package.json ./
RUN bundle install
RUN yarn install
COPY . .
