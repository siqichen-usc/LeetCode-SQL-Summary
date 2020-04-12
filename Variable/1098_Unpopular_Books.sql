-- You could update the variable to any date you want or GETDATE(), and then same analysis will be done for the new date 

DECLARE @d date;
SET @d = '2019-06-23';

SELECT book_id, name
FROM Books
WHERE available_from <= DATEADD(month, -1, @d)
    -- find books that have sold more than 10 copies in the last year
    AND book_id NOT IN (
        SELECT book_id
        FROM Orders
        WHERE dispatch_date > DATEADD(year, -1, @d)
        GROUP BY book_id
        HAVING SUM(quantity) >= 10 
    );
