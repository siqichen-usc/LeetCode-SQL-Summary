-- You could update the variable to any date you want or GETDATE(), and then same analysis will be done for the new date 

-- Solution: Variable
DECLARE @d date;
SET @d = DATEADD(day,-1,'2019-07-05');

SELECT extra AS report_reason, 
    COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE Action_date = @d AND action = 'report'
GROUP BY extra;
