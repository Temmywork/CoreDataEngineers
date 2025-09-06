#!/bin/bash

# Move CSV and JSON files script

# Set the base directory
BASE_DIR="$HOME/CoreDataEngineers"

# Create destination folder
mkdir -p "$BASE_DIR/json_and_CSV"

# Moving all CSV files to json_and_CSV folder
mv $BASE_DIR/*.csv "$BASE_DIR/json_and_CSV/" 2>/dev/null

# Moving all JSON files to json_and_CSV folder  
mv $BASE_DIR/*.json "$BASE_DIR/json_and_CSV/" 2>/dev/null

#view files
ls "$BASE_DIR/json_and_CSV/"
