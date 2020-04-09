SELECT p.firstname, p.lastname, a.city, a.state
FROM person p
-- LEFT JOIN return all records from the left table, and the matched records from the right table
LEFT JOIN address a
  ON p.personid = a.personid;
