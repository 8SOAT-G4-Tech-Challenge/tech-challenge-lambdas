#!/bin/bash
base_folder="$(pwd)/lambdas"

folders=$(find "$base_folder" -mindepth 1 -maxdepth 1 -type d)

for folder in $folders;
do
  echo "Building $folder..."
  
  cd "$folder" || { echo "Failed to enter $folder"; exit 1; }

  if npm run build; then
    echo "Build completed for $folder"
  else
    echo "Build failed for $folder"
    exit 1;
  fi
  
  cd ../..
done

echo "Build completed!"