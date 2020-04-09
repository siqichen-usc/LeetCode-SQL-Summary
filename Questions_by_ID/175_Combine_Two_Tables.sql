-- Solution: Join
SELECT p.firstname, p.lastname, a.city, a.state
FROM person p
-- LEFT JOIN could keep all records in the left table, and records which match with left records in right table
LEFT JOIN address a
  ON p.personid = a.personid
