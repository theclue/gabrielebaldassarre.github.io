FROM eu.gcr.io/mrm-rstudiocloud/gabrielebaldassarre-knitr AS knitter
WORKDIR /output
COPY . /output
RUN make

FROM ruby:2.6.4-alpine AS jekyll-builder
WORKDIR /app
ENV RAILS_ENV production
ENV JEKYLL_ENV production

RUN apk update && apk --update add ruby ruby-irb nodejs ruby-json ruby-rake \
   ruby-bigdecimal ruby-io-console libstdc++ tzdata  \
   libffi-dev libxml2-dev libxslt-dev

# Necessary for some gems which are compiled on bundle install

RUN apk add --virtual build-deps git build-base ruby-dev \
   libc-dev linux-headers && \
   gem install bundler && \
   bundle config build.nokogiri --use-system-libraries

COPY Gemfile* /app/
RUN bundle install --clean --without development test
COPY --from=knitter /output/_posts/generated ./_posts/generated
COPY --from=knitter /output/assets/figures ./assets/figures
COPY . /app
RUN bundle exec jekyll build -d ./build --verbose

# Copy to nginx
FROM nginx:alpine
COPY --from=jekyll-builder /app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
