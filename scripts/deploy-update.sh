#!/bin/bash
base_folder="/lambdas"

folders=$(find "$base_folder" -mindepth 1 -maxdepth 1 -type d)

for folder in $folders;
do
  echo "Deploying $folder..."
  
  cd "$folder" || { echo "Failed to enter $folder"; exit 1; }

  if aws lambda update-function-code --function-name tech-challenge-$folder --zip-file fileb://$folder.zip; then
    echo "Deploy completed for $folder"
  else
    echo "Deploy failed for $folder"
    exit 1;
  fi
  
  cd ../..
done

echo "Deploy completed!"