# Q6) Find the least expensive product from each category and 
#     print the table with category id, name, product name and price of the product.

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    cat.CAT_ID,
    CAT_NAME,
    PRO_ID,
    PRO_NAME,
    MIN(MIN_PRICE) AS MinProductPrice
FROM
    category AS cat
        INNER JOIN
    (SELECT 
        prod.PRO_ID, PRO_NAME, CAT_ID, MIN_PRICE
    FROM
        product AS prod
    INNER JOIN (SELECT 
        pro_id AS PRO_ID, MIN(supp_price) AS MIN_PRICE
    FROM
        supplier_pricing
    GROUP BY pro_id) AS sp ON prod.pro_id = sp.pro_id) AS pro_sp ON cat.cat_id = pro_sp.CAT_ID
GROUP BY cat_id
