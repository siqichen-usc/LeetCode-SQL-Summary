-- when the number is continous with the last one, both log_id and r add 1
-- Therefore, continuous numbers share the same log_id - r
-- when grouped by log_id - r, the start number is the samllest number in group and the end is the largest
WITH tb1 AS (
    SELECT log_id, ROW_NUMBER() OVER (ORDER BY log_id) AS r
    FROM Logs
)

SELECT MIN(log_id) AS START_ID, MAX(log_id) AS END_ID
FROM tb1
GROUP BY log_id-r;
