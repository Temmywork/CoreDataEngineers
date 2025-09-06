# CoreDataEngineers - Parch and Posey Analysis

## Project Overview
Analysis of competitor Parch and Posey's sales data for CoreDataEngineers market research.

## Project Structure
- Scripts/bash/ contains ETL pipeline and database loading scripts
- Scripts/sql/ contains SQL queries for data analysis
- raw/ folder for downloaded data
- Transformed/ folder for processed data
- Gold/ folder for final data

## ETL Pipeline Architecture
CSV Data Source - > Download (Extract) - > Transform Data - > Load to Gold - > PostgreSQL Database - > SQL Analysis - > Business Insights

## Setup Instructions

1. Run ETL pipeline
2. Load data to PostgreSQL database
3. Execute SQL analysis queries

## SQL Analysis

Query1: identifies large volume orders exceeding 4000 units.

Query2: finds specialized orders with no standard products.

Query3: searches for specific company patterns based on names and contacts.

Query4: maps the complete sales organization structure.

## Database Information
Database name: posey
Tables: region, sales_reps, accounts, orders, web_events

## Tools Used
- Bash
- PostgreSQL
- Docker

