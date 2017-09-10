#!/bin/bash

docker pull kaizhang/haskell-stack
docker run -v `pwd`:/build:rw kaizhang/haskell-stack /bin/bash -c \
    "cd build && stack build --allow-different-user"
