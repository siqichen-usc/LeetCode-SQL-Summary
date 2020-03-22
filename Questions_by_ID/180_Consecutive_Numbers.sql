-- Solution: Window Function
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
        LEAD(num) OVER (ORDER BY id)  AS next,
        LAG(num) OVER (ORDER BY id)  AS prev
    FROM logs
    ) tb1
WHERE num = next AND next = prev;



-- Solution: Join
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
JOIN logs l2
    ON l1.id = l2.id-1 AND l1.num = l2.num
JOIN logs l3
    ON l1.id = l3.id-2 AND l2.num = l3.num;
