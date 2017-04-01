#!/bin/bash
ENV=$RACK_ENV

if [ "$ENV" = 'production' ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -it -e "RACK_ENV=$ENV" docker_rails:0.1 s
  exit 0
fi

if [ $# -eq 0 ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -e "RACK_ENV=development" docker_rails:0.1
elif [ $1 = 'rspec' ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -e "RACK_ENV=test" docker_rails:0.1 $@
elif [ $1 = 's' ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -it -e "RACK_ENV=development" docker_rails:0.1 s
fi
