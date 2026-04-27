-- Month-wise Sales
SELECT MONTHNAME(check_in) AS month,
SUM(amount - discount) AS actual_sales
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY month
ORDER BY actual_sales DESC;

-- Month-wise Discount
SELECT MONTHNAME(check_in) AS month,
SUM(discount) AS total_discount
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY month
ORDER BY total_discount DESC;

-- Cancellation Rate
SELECT 
MONTHNAME(check_in) AS month,
COUNT(*) AS total_bookings,
SUM(status = 'cancelled') AS cancelled,
(SUM(status = 'cancelled') / COUNT(*)) * 100 AS cancellation_rate
FROM oyo_sales_csv
GROUP BY month
ORDER BY cancellation_rate DESC;

-- City-wise Average Booking
SELECT c.city, AVG(s.amount) AS avg_booking
FROM oyo_sales_csv s
JOIN oyo_city_csv c
ON s.hotel_id = c.hotel_id
GROUP BY c.city;

-- Total Hotels per City (Fixed Query)
SELECT city, COUNT(*) AS total_hotels
FROM oyo_city_csv
GROUP BY city;

-- Loyal Customers
SELECT customer_id, COUNT(*) AS total_booking
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Loyal Customers with City
SELECT s.customer_id, COUNT(*) AS total_booking, c.city, SUM(s.amount) AS total_amount
FROM oyo_sales_csv s
JOIN oyo_city_csv c
ON s.hotel_id = c.hotel_id
WHERE s.status = 'Stayed'
GROUP BY s.customer_id, c.city
HAVING COUNT(*) > 1;

-- Room Booking Frequency
SELECT no_of_rooms, COUNT(*) AS total_booked
FROM oyo_sales_csv
WHERE status = 'Stayed'
GROUP BY no_of_rooms
ORDER BY total_booked DESC;

-- Avg Cost per Room
SELECT c.city,
SUM(s.no_of_rooms) AS total_rooms,
SUM(s.amount) / SUM(s.no_of_rooms) AS avg_per_room
FROM oyo_sales_csv s
JOIN oyo_city_csv c
ON s.hotel_id = c.hotel_id
WHERE s.status = 'Stayed'
GROUP BY c.city;

