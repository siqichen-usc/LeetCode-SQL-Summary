# Subquery

## Basic Structure

```SQL
SELECT AVG(total_spent)
FROM (
  SELECT TOP 10 a.name, SUM(total_amt_usd) AS total_spent
  FROM accounts a
    JOIN orders o
      ON o.account_id = a.id
  GROUP BY a.name
  ORDER BY total_spent DESC
) tbl1
```

## Using WITH

``` SQL
WITH tbl1 AS (
  SELECT AVG(total_amt_usd) avg_spent
  FROM orders
),
tbl2 AS(
  SELECT a.name, AVG(total_amt_usd) total_spent
  FROM accounts a
    JOIN orders o
      ON o.account_id = a.id
    GROUP BY a.name
  HAVING AVG(total_amt_usd) > (SELECT * FROM tbl1)
)

SELECT AVG(total_spent)
FROM tbl2
  ```
