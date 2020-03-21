# OFFSET and FETCH

## Basic Structre

```SQL
SELECT *
FROM table
ORDER BY column_list [ASC |DESC]
OFFSET offset_row_count {ROW | ROWS}
FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY
```
