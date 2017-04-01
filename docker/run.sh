#!/bin/ash

if [ "$RACK_ENV" = 'development' -o "$RACK_ENV" = 'test' -o "$RACK_ENV" = '' ]; then
  if [ $# -eq 0 ]; then
    bundle exec rails -h
  elif [ $1 = 'rspec' ]; then
    bundle exec $@
  else
    bundle exec rails $@
  fi
  exit 0
fi

bundle exec unicorn -c config/unicorn.rb -E $RACK_ENV -D
