#!/bin/bash
if [ $# -eq 0 ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -e "RACK_ENV=development" docker_rails:0.1
elif [ $1 = 'rspec' ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -e "RACK_ENV=test" docker_rails:0.1 $@
elif [ $1 = 's' ]; then
  docker run -p 3000:3000 -v `pwd`:/myapp -it -e "RACK_ENV=development" docker_rails:0.1 s
fi
