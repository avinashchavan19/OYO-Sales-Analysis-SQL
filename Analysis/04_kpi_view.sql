-- KPI View
CREATE VIEW sales_view AS
SELECT 
    COUNT(*) AS number_of_customers,
    MAX(amount) AS maximum_sales,
    MIN(amount) AS minimum_sales,
    MIN(discount) AS minimum_discount,
    MAX(discount) AS maximum_discount,
    SUM(no_of_rooms) AS total_rooms,
    AVG(amount) AS average_sales,
    AVG(discount) AS average_discount
FROM oyo_sales_csv;

-- View Data
SELECT * FROM sales_view;

