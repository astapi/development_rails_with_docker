FROM ruby:2.4.1-alpine

ENV LANG ja_JP.UTF-8
ENV BUILD_PACKAGES="curl-dev build-base" \
    DEV_PACKAGE="mariadb-libs mariadb-client mariadb-client-libs tzdata"

RUN gem install bundler \
  && apk --update --upgrade add $BUILD_PACKAGES \
  && apk add mariadb-dev tzdata linux-headers \
  && rm /usr/lib/libmysqld*

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

EXPOSE  3000
ENTRYPOINT ["/myapp/docker/run.sh"]
