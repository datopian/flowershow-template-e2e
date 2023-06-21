#!/bin/sh

APP_DIR=$(cat test-app-dir)
CONTENT_DIR=./fixtures/content
TEST_APP_DIR=test-app

# copy contents of the app (apart from any paths ignored in .gitignore) to the test-app dir
rsync -av --progress --exclude=.git --exclude-from=$APP_DIR/.gitignore $APP_DIR/ $TEST_APP_DIR

# replace /content in the test-app dir with /fixtures/content
rm -rf $TEST_APP_DIR/content/*
rsync -av --progress $CONTENT_DIR/ $TEST_APP_DIR/content

cd $TEST_APP_DIR
# npm run export
npm run build
