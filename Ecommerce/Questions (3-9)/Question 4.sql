# Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT 
    `order`.*, product.pro_name, customer.cus_name
FROM
    `order`,
    supplier_pricing,
    product,
    customer
WHERE
    `order`.pricing_id = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id
        AND `order`.cus_id = customer.cus_id
        AND customer.cus_id = 2;
