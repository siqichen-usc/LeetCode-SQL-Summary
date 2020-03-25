-- Solution 1: Basics
SELECT name 
FROM customer
WHERE ISNULL(referee_id,0) != 2;



-- Solution 2: Basics
SELECT name 
FROM customer
WHERE COALESCE(referee_id,0) != 2;



-- Solution 3: Basics
SELECT name
FROM customer
WHERE referee_id != 2 OR referee_id IS NULL;
