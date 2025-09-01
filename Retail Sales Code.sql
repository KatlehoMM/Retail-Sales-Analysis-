SELECT 
      COUNT(DISTINCT `Transaction ID`) AS number_of_sales,
      COUNT(DISTINCT `Customer ID`) AS number_of_customers,
      DAYNAME(`Date`) AS day,
      DAYOFMONTH(`Date`) AS day_of_month,
      MONTHNAME(`Date`) AS month,
CASE
    WHEN `AGE` BETWEEN 0 AND 15 THEN '01. 0-15: KIDS'
    WHEN `AGE` BETWEEN 16 AND 20 THEN '02. 16-20: TEEN'
    WHEN `AGE` BETWEEN 21 AND 30 THEN '03. 21-30: YOUNG ADULT'
    WHEN `AGE` BETWEEN 31 AND 40 THEN '04. 31-40: ADULT'
ELSE '05. 41+: SENIORS'
END AS age_group,
       `GENDER`,
       DATE AS purchase_date,
       `Transaction ID`,
       `PRODUCT CATEGORY`,
      SUM(`Price per Unit`) AS total_price_per_unit,
      SUM(`Quantity`) AS total_quantity,
      SUM(`Total Amount`) AS total_revenue,
CASE 
    WHEN `Total Amount` BETWEEN 0 AND 100 THEN '01. <100: LOW'
    WHEN `Total Amount` BETWEEN 101 AND 500 THEN '02. 101-500: MEDIUM'
ELSE '03. >500: HIGH'
END AS revenue_group
FROM retail_sales_2025
GROUP BY ALL;
