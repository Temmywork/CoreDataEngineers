-- Connect to database
\c posey;

-- Query 1: Find order IDs where gloss_qty or poster_qty is greater than 4000
-- Only include the id field
SELECT id 
FROM orders 
WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Query 2: Orders where standard_qty is zero and either gloss_qty or poster_qty is over 1000  
SELECT * 
FROM orders 
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Query 3: Company names starting with 'C' or 'W' where primary contact contains 'ana' or 'Ana' but not 'eana'
SELECT name, primary_poc, website
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';

-- Query 4: Show region, sales rep, and account names sorted alphabetically by account
SELECT r.name AS region_name, 
       sr.name AS sales_rep_name, 
       a.name AS account_name
FROM accounts a
JOIN sales_reps sr ON a.sales_rep_id = sr.id
JOIN region r ON sr.region_id = r.id
ORDER BY a.name;
