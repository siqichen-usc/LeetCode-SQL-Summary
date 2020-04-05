WITH tb1 AS (
    SELECT ad_id, [Clicked], [Viewed], [Ignored]
    FROM Ads
    PIVOT (
        COUNT(action) FOR action IN ([Clicked], [Viewed], [Ignored])
    ) pvt
)

SELECT ad_id,
    CASE
        WHEN SUM(Clicked+Viewed) = 0 THEN 0.0
        ELSE CAST(SUM(Clicked)*100.0/SUM(Clicked+Viewed) AS DECIMAL(5,2))
    END AS ctr
FROM tb1
GROUP BY ad_id
ORDER BY ctr DESC, ad_id;
