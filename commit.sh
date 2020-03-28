#! /bin/bash

#2019-03-20 12:40:33
message=`date +"%Y-%m-%d %H:%M:%S"`

cd public && \
   git add . && \
   git commit -s -m "$message"

cd ..

cd public && \
   git push && \
   cd ..
