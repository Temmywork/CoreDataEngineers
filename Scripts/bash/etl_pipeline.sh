#!/bin/bash

# ETL Pipeline Script

BASE_DIR="$HOME/CoreDataEngineers"

# Set URL as environment variable
export CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# EXTRACT step - Download the CSV file
mkdir -p "$BASE_DIR/raw"
curl -L -o "$BASE_DIR/raw/data.csv" "$CSV_URL"

# view the data
ls -la "$BASE_DIR/raw"

# TRANSFORM - Renaming the column
mkdir -p "$BASE_DIR/Transformed"

# Change Variable_code to variable_code
sed 's/Variable_code/variable_code/' "$BASE_DIR/raw/data.csv" > "$BASE_DIR/Transformed/temp.csv"

# Selecting the column Year, Value, Units, variable_code columns
csvcut -c 1,9,5,6 "$BASE_DIR/Transformed/temp.csv" > "$BASE_DIR/Transformed/2023_year_finance.csv"
rm "$BASE_DIR/Transformed/temp.csv"

# view the data
ls -la "$BASE_DIR/Transformed"

# LOAD - Copy to Gold folder
mkdir -p "$BASE_DIR/Gold"
cp "$BASE_DIR/Transformed/2023_year_finance.csv" "$BASE_DIR/Gold/2023_year_finance.csv"

# view the data
ls -la "$BASE_DIR/Gold"

