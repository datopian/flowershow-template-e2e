#!/bin/sh

CONTENT_DIR=./fixtures/content
TEST_APP_DIR=test-app

# replace /content in the test-app dir with /fixtures/content
rm -rf $TEST_APP_DIR/content/*
rsync -av --progress $CONTENT_DIR/ $TEST_APP_DIR/content

cd $TEST_APP_DIR
# npm run export
npm run build
