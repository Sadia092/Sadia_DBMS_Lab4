# Q5) Display the Supplier details who can supply more than one product.

SELECT 
    sup.supp_id, supp_name, supp_city, supp_phone
FROM
    supplier AS sup
        INNER JOIN
    (SELECT 
        supp_id
    FROM
        supplier_pricing
    GROUP BY supp_id
    HAVING COUNT(supp_id) > 1) AS sp ON sup.supp_id = sp.supp_id;
