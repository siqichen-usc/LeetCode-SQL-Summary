# Window Function

## Basic Structure
```SQL
SELECT TOP 10 standard_amt_usd, MONTH(occured_at)
  ,SUM(standard_amt_usd) OVER (
    PARTITION BY MONTH(occured_at)
    ORDER BY occurred_at
    ) AS running_total
FROM orders
```

## Common Window Functions 

- Window functions **_cannot_** be used in **HAVING** clause.

1. **```ROW_NUMBER()```** does just what it sounds like — displays **the number of a given row**. It starts at 1 and numbers the rows according to the **ORDER BY** part of the window statement. **ROW_NUMBER()** does not require you to specify a variable within the parentheses. Using the **PARTITION BY** clause will allow you to begin counting 1 again in each partition.
2. **```RANK()```** returns the rank of each row within the partition of a result set. The rank of a row is one plus the number of ranks that come before the row in question.
3. **```DENSE_RANK()```** returns the rank of each row within a result set partition, with **no gaps in the ranking values**. The rank of a specific row is one plus the number of distinct rank values that come before that specific row.
4. **```NTILE(# of buckets)```** distributes the rows in an ordered partition into a specified number of groups. The groups are numbered, starting at one. For each row, **NTILE** returns the number of the group to which the row belongs. In this case, **ORDER BY** determines which column to use to determine the quartiles (or whatever number of tiles you specify).

This example shows the four ranking functions

- **```DENSE_RANK()```**
- **```NTILE()```**
- **```RANK()```**
- **```ROW_NUMBER()```**

used in the same query. See each ranking function for function-specific examples.

```SQL
SELECT p.FirstName, p.LastName  
    ,ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS "Row Number"  
    ,RANK() OVER (ORDER BY a.PostalCode) AS Rank  
    ,DENSE_RANK() OVER (ORDER BY a.PostalCode) AS "Dense Rank"  
    ,NTILE(4) OVER (ORDER BY a.PostalCode) AS Quartile  
    ,s.SalesYTD  
    ,a.PostalCode  
FROM Sales.SalesPerson AS s   
    INNER JOIN Person.Person AS p   
        ON s.BusinessEntityID = p.BusinessEntityID  
    INNER JOIN Person.Address AS a   
        ON a.AddressID = p.BusinessEntityID  
WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0;  
```
Here is the result table.

| FirstName | LastName          | Row Number | Rank | Dense Rank | Quartile | SalesYTD     | PostalCode |
|-----------|-------------------|------------|------|------------|----------|--------------|------------|
| Michael   | Blythe            | 1          | 1    | 1          | 1        | 4557045.0459 | 98027      |
| Linda     | Mitchell          | 2          | 1    | 1          | 1        | 5200475.2313 | 98027      |
| Jillian   | Carson            | 3          | 1    | 1          | 1        | 3857163.6332 | 98027      |
| Garrett   | Vargas            | 4          | 1    | 1          | 1        | 1764938.9859 | 98027      |
| Tsvi      | Reiter            | 5          | 1    | 1          | 2        | 2811012.7151 | 98027      |
| Shu       | Ito               | 6          | 6    | 2          | 2        | 3018725.4858 | 98055      |
| José      | Saraiva           | 7          | 6    | 2          | 2        | 3189356.2465 | 98055      |
| David     | Campbell          | 8          | 6    | 2          | 3        | 3587378.4257 | 98055      |
| Tete      | Mensa-Annan       | 9          | 6    | 2          | 3        | 1931620.1835 | 98055      |
| Lynn      | Tsoflias          | 10         | 6    | 2          | 3        | 1758385.926  | 98055      |
| Rachel    | Valdez            | 11         | 6    | 2          | 4        | 2241204.0424 | 98055      |
| Jae       | Pak               | 12         | 6    | 2          | 4        | 5015682.3752 | 98055      |
| Ranjit    | Varkey Chudukatil | 13         | 6    | 2          | 4        | 3827950.238  | 98055      |
