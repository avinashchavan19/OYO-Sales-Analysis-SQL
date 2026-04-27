-- 1. Max Revenue Hotel
SELECT hotel_id, SUM(amount) AS total_revenue
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY hotel_id
ORDER BY total_revenue DESC;

-- 2. Revenue Lost (Cancelled)
SELECT hotel_id, SUM(amount) AS revenue_lost
FROM oyo_sales_csv
WHERE status = 'Cancelled'
GROUP BY hotel_id
ORDER BY revenue_lost DESC;

-- 3. Best Booking Day
SELECT DAYNAME(check_in) AS booking_day,
SUM(amount) AS total_revenue
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY booking_day
ORDER BY total_revenue DESC;

-- 4. Status Count
SELECT status, COUNT(*) AS total_count
FROM oyo_sales_csv
GROUP BY status;

-- 5. Status Percentage
SELECT status,
(COUNT(*) * 100) / (SELECT COUNT(*) FROM oyo_sales_csv) AS percentage
FROM oyo_sales_csv
GROUP BY status;

-- 6. City-wise Status
SELECT c.city, s.status, COUNT(*) AS total_count
FROM oyo_sales_csv s
JOIN oyo_city_csv c
ON s.hotel_id = c.hotel_id
GROUP BY c.city, s.status;

