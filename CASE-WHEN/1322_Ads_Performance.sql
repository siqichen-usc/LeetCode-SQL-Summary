SELECT ad_id,
    CAST(
        ISNULL(
            AVG(
                CASE 
                    WHEN action = 'Clicked' THEN 100.0 
                    WHEN action = 'Viewed' THEN 0
                    ELSE NULL
                END
                )
            ,0)
        AS DECIMAL(5,2)
    ) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id;
