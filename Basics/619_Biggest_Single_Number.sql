SELECT MAX(num) AS num
FROM (
    -- Select numbers appear only once
    SELECT num 
    FROM my_numbers 
    GROUP BY num 
    HAVING COUNT(*) = 1
) tb1;
