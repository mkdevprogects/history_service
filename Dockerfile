FROM ruby:2.4
MAINTAINER Anton Karpenko <toshidono.it.work@gmail.com>

COPY . /app/
WORKDIR /app
RUN gem install foreman
RUN bundle install
EXPOSE 5000
EXPOSE 9292
CMD ./wait-for-it.sh -t 30 postgres:5432 && ./wait-for-it.sh -t 30 redis:6379 && foreman start