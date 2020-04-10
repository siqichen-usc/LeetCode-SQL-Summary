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
