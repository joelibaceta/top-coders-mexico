FROM ruby:3.0.0

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN apt-get update

# Instalar las dependencias de Jekyll
RUN apt-get install -y build-essential zlib1g-dev
RUN bundle install

COPY . .

VOLUME [ "/.site" ]

CMD ["jekyll", "build", "--destination", ".site"]