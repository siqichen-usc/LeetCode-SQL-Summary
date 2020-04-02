WITH tb1 AS (
    SELECT seller_id, item_id
    FROM (
        SELECT seller_id, item_id,
            ROW_NUMBER() OVER (PARTITION BY seller_id ORDER BY order_date) AS r
        FROM Orders
        ) rank
    WHERE r = 2
)

SELECT u.user_id AS seller_id,
    CASE
        WHEN u.favorite_brand = i.item_brand THEN 'yes'
        ELSE 'no'
    END AS '2nd_item_fav_brand'
FROM Users u
LEFT JOIN tb1
ON u.user_id = tb1.seller_id
LEFT JOIN Items i
ON tb1.item_id = i.item_id;
