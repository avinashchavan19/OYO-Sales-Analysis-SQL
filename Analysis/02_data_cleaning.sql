
-- Check NULL values
SELECT * 
FROM oyo_sales_csv
WHERE "ï»¿booking_id" IS NULL;

-- Check duplicates
SELECT COUNT(ï»¿booking_id), ï»¿booking_id
FROM oyo_sales_csv
GROUP BY ï»¿booking_id
HAVING COUNT(ï»¿booking_id) > 1;

-- Rename Columns
ALTER TABLE oyo_sales_csv
RENAME COLUMN ï»¿booking_id TO booking_id;

ALTER TABLE oyo_city_csv
RENAME COLUMN ï»¿hotel_id TO hotel_id;

-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Convert check_in
UPDATE oyo_sales_csv
SET check_in = STR_TO_DATE(check_in, '%m/%d/%Y');

ALTER TABLE oyo_sales_csv
MODIFY COLUMN check_in DATE;

-- Convert check_out
UPDATE oyo_sales_csv
SET check_out = STR_TO_DATE(check_out, '%m/%d/%Y');

ALTER TABLE oyo_sales_csv
MODIFY COLUMN check_out DATE;

-- Convert date_of_booking
UPDATE oyo_sales_csv
SET date_of_booking = STR_TO_DATE(date_of_booking, '%m/%d/%Y');

ALTER TABLE oyo_sales_csv
MODIFY COLUMN date_of_booking DATE;
