#!/bin/sh

APP_DIR=$1
CONTENT_DIR=./fixtures/content
TEST_APP_DIR=test-app

# if it doesnt exist, create TEST_APP_DIR in the root of this project
# otherwise, first remove the dir and then create it
if [ ! -d "$TEST_APP_DIR" ]; then
  mkdir $TEST_APP_DIR
else
  rm -rf $TEST_APP_DIR
  mkdir $TEST_APP_DIR
fi

# copy contents of the app (apart from any paths ignored in .gitignore) to the test-app dir
rsync -av --progress --exclude=.git --exclude-from=$APP_DIR/.gitignore $APP_DIR/ $TEST_APP_DIR

# replace /content in the test-app dir with /fixtures/content
rm -rf $TEST_APP_DIR/content/*
rsync -av --progress $CONTENT_DIR/ $TEST_APP_DIR/content

cd $TEST_APP_DIR
# pnpm install
npm install
# npm run export
npm run build
