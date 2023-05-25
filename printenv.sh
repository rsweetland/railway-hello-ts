#!/bin/bash

echo "Hello World"
echo "Railway Env Variable: $PORT"

# Railway cli stdin
while IFS= read -r line; do
  # Echo the input
  echo "$line"
done

