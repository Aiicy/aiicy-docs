#! /bin/bash

cd public && \
git rm -rf . && \
cd .. && \
hugo -d public
