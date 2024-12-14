#!/bin/bash
folders=("authenticate-admin" "authenticate-customer")

for folder in "${folders[@]}"
do
  echo "Building $folder..."
  cd lambdas/$folder
  npm run build
  cd ../..
done

echo "Build completed!"