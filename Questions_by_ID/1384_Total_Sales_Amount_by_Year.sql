-- Solution: Recursive CTE, Join
-- get all dates from MIN(period_start) to MAX(period_end)
WITH cte AS (
    SELECT MIN(period_start) AS date, MAX(period_end) AS end_date
    FROM Sales
    UNION ALL
    SELECT DATEADD(day,1,date), end_date
    FROM cte
    WHERE date < end_date
)

-- after join, products will have same number of records as the number of days in sale period
SELECT s.product_id AS PRODUCT_ID,
    p.product_name AS PRODUCT_NAME, 
    CAST(Year(cte.date) AS CHAR(4)) AS REPORT_YEAR, 
    SUM(average_daily_sales) AS TOTAL_AMOUNT
FROM cte
JOIN Sales s
ON cte.date BETWEEN s.period_start AND s.period_end
JOIN Product p
ON s.product_id = p.product_id
GROUP BY s.product_id, p.product_name, Year(cte.date)
ORDER BY PRODUCT_ID, REPORT_YEAR
OPTION (MAXRECURSION 0);
