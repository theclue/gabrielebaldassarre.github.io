FROM jekyll/jekyll:4.0

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./

RUN apk update && apk --update add ruby ruby-irb nodejs ruby-json ruby-rake \
   ruby-bigdecimal ruby-io-console libstdc++ tzdata  \
   libffi-dev libxml2-dev libxslt-dev

COPY Gemfile* /app/

RUN apk add --virtual build-deps git build-base ruby-dev \
   libc-dev linux-headers \
   && gem install bundler \
   && bundle config build.nokogiri --use-system-libraries \
   && bundle update

RUN bundle install --jobs 20 --retry 5