SELECT *,
    CASE
        -- the sum of any 2 sides of a triangle must be greater than the measure of the third side
        WHEN x+y > z AND y+z > x AND z+x > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle;
