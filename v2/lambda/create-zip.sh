#! /bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: create-zip.sh DIR_NAME"
    exit 1
fi

set -e

cd $1
yarn
yarn test
rm -rf node_modules
yarn --production
FUNC_NAME=$(json name -f package.json )
FUNC_DIR=$(pwd)
zip -r ../$FUNC_NAME.zip *
cd ..
cd $1 
yarn
