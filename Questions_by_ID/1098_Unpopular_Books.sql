-- Solution 1: Subquery 
SELECT book_id, name
FROM Books
WHERE available_from <= '2019-05-23' 
    AND book_id NOT IN (
        SELECT book_id
        FROM Orders
        WHERE dispatch_date >= '2018-06-24'
        GROUP BY book_id
        HAVING SUM(quantity) >= 10 
    );

  

-- Solution 2: Subquery 
-- Solution 2 is better in terms of automation. 
-- You could update the varialbe to any date you want or TODAY(), and then the same analysis will be done for the new date 

DECLARE @d date;
SET @d = '2019-06-23';

SELECT book_id, name
FROM Books
WHERE available_from <= DATEADD(month, -1, @d)
    AND book_id NOT IN (
        SELECT book_id
        FROM Orders
        WHERE dispatch_date > DATEADD(year, -1, @d)
        GROUP BY book_id
        HAVING SUM(quantity) >= 10 
    );
