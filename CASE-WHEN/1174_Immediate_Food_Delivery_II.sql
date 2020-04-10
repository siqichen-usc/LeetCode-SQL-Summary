-- Solution 1: Subquery, CASE WHEN
WITH tb1 AS (
    -- fod refers to first order date, and fdd refers to first delivery date
    SELECT MIN(order_date) AS fod, MIN(customer_pref_delivery_date) AS fdd
    FROM Delivery
    GROUP BY customer_id
)

-- Since it is guaranteed that a customer has exactly one first order,
-- when fod = fdd, the first order of that customer must be immediate order
SELECT CAST(
    AVG(
        CASE
            WHEN fod = fdd THEN 100.0
            ELSE 0
        END
       )
    AS DECIMAL(5,2)
) AS immediate_percentage
FROM tb1;



-- Solution 2: Window Function, Subquery, CASE WHEN
WITH tb1 AS (
    SELECT order_date, customer_pref_delivery_date,
        -- identify first order of each customer
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS r
    FROM delivery
)

SELECT CAST(
    AVG(
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 100.0
            ELSE 0
        END
       )
    AS DECIMAL(5,2)
) AS immediate_percentage
FROM tb1
WHERE r = 1;
