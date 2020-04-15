-- when the number is continous with the last one, both log_id and r add 1
-- Therefore, continuous numbers share the same log_id - r
-- when grouped by log_id - r, the start number is the samllest number in group and the end is the largest
WITH tb1 AS (
    SELECT l1.log_id, COUNT(*) AS r
    FROM Logs l1
    JOIN Logs l2
    ON l1.log_id >= l2.log_id
    GROUP BY l1.log_id
)

SELECT MIN(log_id) AS START_ID, MAX(log_id) AS END_ID
FROM tb1
GROUP BY log_id-r;
