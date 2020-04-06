WITH tb1 AS (
    SELECT c.customer_id, c.customer_name,
        COUNT(con.contact_name) AS contacts_cnt,
        COUNT(c2.customer_id) AS trusted_contacts_cnt
    FROM Customers c
    LEFT JOIN Contacts con
    ON c.customer_id = con.user_id
    LEFT JOIN Customers c2
    ON con.contact_email = c2.email
    GROUP BY c.customer_id, c.customer_name
)

SELECT i.invoice_id, 
    tb1.customer_name, 
    i.price, 
    tb1.contacts_cnt,
    tb1.trusted_contacts_cnt
FROM Invoices i
JOIN tb1
ON i.user_id = tb1.customer_id
ORDER BY i.invoice_id;
