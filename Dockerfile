FROM ruby:2.5.5 AS rails-toolbox

RUN apt-get update -yqq
RUN apt-get install -y nodejs postgresql apache2 npm
RUN npm install --global yarn

WORKDIR /app

COPY . .
RUN bundle install
RUN yarn install
