SELECT p.firstname, p.lastname, a.city, a.state
FROM person p
LEFT JOIN address a
  ON p.personid = a.personid;
