#!/bin/bash
DIR="/home/ec2-user/アプリケーション名"
DIR_CURRENT=${DIR}/current

if [[ -d "$DIR_CURRENT" ]]; then
   cd $DIR_CURRENT
   echo $DIR_CURRENT
else
   cd $DIR
   echo $DIR
fi
bundle exec rails s -e production >> puma.log &