FROM ruby:2.4.2-alpine3.6

ENV PORT 9292

COPY . /opt/app
WORKDIR /opt/app

RUN bundle install -j 4

CMD ["sh", "-c", "bundle exec rackup -o 0.0.0.0 -p ${PORT}"]