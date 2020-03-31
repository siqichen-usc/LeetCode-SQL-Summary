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
-- Solution 2 is better in sense of automation. 
-- You could change date to anydate you want or TODAY(), and same analysis could be done with out repetitive work
-- Also, you can store the date into a variable. Then, to generate a new analyis, the only thing needed is to update varialbe.

SELECT book_id, name
FROM Books
WHERE available_from <= DATEADD(month, -1, '2019-06-23')
    AND book_id NOT IN (
        SELECT book_id
        FROM Orders
        WHERE dispatch_date > DATEADD(year, -1, '2019-06-23')
        GROUP BY book_id
        HAVING SUM(quantity) >= 10 
    );
