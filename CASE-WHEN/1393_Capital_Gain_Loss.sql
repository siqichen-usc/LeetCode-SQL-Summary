-- For this question, the last operation of a stock is always "sell" 
-- and it is guaranteed that every "sell" has a "buy" before it,
-- so we could simplify this to a CASE WHEN questions, otherwise, WINDOW FUNCTION could be a better choice
SELECT stock_name,
    SUM(
        CASE 
            WHEN operation = 'Buy' THEN -price 
            ELSE price END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;
