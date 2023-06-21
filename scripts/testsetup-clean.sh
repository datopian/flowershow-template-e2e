#!/bin/sh

APP_DIR=$1
TEST_APP_DIR=test-app

# Save APP_DIR value to a file and overwrite it every time
echo $APP_DIR > test-app-dir

# if it doesnt exist, create TEST_APP_DIR in the root of this project
# otherwise, first remove the dir and then create it
if [ ! -d "$TEST_APP_DIR" ]; then
  mkdir $TEST_APP_DIR
else
  rm -rf $TEST_APP_DIR
  mkdir $TEST_APP_DIR
fi

# copy over package.json and package-lock.json to the test-app dir
cp $APP_DIR/package.json $TEST_APP_DIR
cp $APP_DIR/package-lock.json $TEST_APP_DIR

cd $TEST_APP_DIR
pnpm install
# npm install
