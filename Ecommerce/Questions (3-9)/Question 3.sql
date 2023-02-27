# Q3) 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

SELECT 
    COUNT(cus_gender) AS TotalNoOfCustomers, cus_gender
FROM
    (SELECT 
        cus_gender, cus_name
    FROM
        customer AS cus
    INNER JOIN (SELECT 
        ord_id, cus_id
    FROM
        `order`
    WHERE
        ord_amount >= '3000') AS o ON cus.cus_id = o.cus_id
    GROUP BY cus.cus_id) AS T
GROUP BY cus_gender;


