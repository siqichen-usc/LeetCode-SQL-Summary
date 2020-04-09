-- Solution: CASE WHEN
SELECT CAST(
    AVG(
        -- using 100.0 rather than 100 is to ensure the type of number is float
        -- so that the number will keep digits after the decimal point when averaging
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 100.0
            ELSE 0
        END
       )
    AS DECIMAL(5,2)
) AS immediate_percentage
FROM Delivery;
