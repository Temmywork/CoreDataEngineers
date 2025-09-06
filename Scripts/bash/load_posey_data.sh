#!/bin/bash

# Create posey database
docker exec postgres-setup-postgres-1 psql -U postgres -c "CREATE DATABASE posey;" 2>/dev/null

# Drop existing tables
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "DROP TABLE IF EXISTS web_events;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "DROP TABLE IF EXISTS orders;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "DROP TABLE IF EXISTS accounts;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "DROP TABLE IF EXISTS sales_reps;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "DROP TABLE IF EXISTS region;"

# Create tables
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "CREATE TABLE region (id INTEGER, name VARCHAR(100));"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "CREATE TABLE sales_reps (id INTEGER, name VARCHAR(100), region_id INTEGER);"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "CREATE TABLE accounts (id INTEGER, name VARCHAR(200), website VARCHAR(200), lat DECIMAL, long DECIMAL, primary_poc VARCHAR(100), sales_rep_id INTEGER);"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "CREATE TABLE orders (id INTEGER, account_id INTEGER, occurred_at TIMESTAMP, standard_qty DECIMAL, gloss_qty DECIMAL, poster_qty DECIMAL, total DECIMAL, standard_amt_usd DECIMAL, gloss_amt_usd DECIMAL, poster_amt_usd DECIMAL, total_amt_usd DECIMAL);"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "CREATE TABLE web_events (id INTEGER, account_id INTEGER, occurred_at TIMESTAMP, channel VARCHAR(50));"

# Copy CSV files to Docker container
docker cp region.csv postgres-setup-postgres-1:/tmp/
docker cp sales_reps.csv postgres-setup-postgres-1:/tmp/
docker cp accounts.csv postgres-setup-postgres-1:/tmp/
docker cp orders.csv postgres-setup-postgres-1:/tmp/
docker cp web_events.csv postgres-setup-postgres-1:/tmp/

# Load CSV files
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "\COPY region FROM '/tmp/region.csv' WITH CSV HEADER;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "\COPY sales_reps FROM '/tmp/sales_reps.csv' WITH CSV HEADER;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "\COPY accounts FROM '/tmp/accounts.csv' WITH CSV HEADER;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "\COPY orders FROM '/tmp/orders.csv' WITH CSV HEADER;"
docker exec postgres-setup-postgres-1 psql -U postgres -d posey -c "\COPY web_events FROM '/tmp/web_events.csv' WITH CSV HEADER;"
