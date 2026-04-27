
-- Primary Key (City Table)
ALTER TABLE oyo_city_csv
ADD PRIMARY KEY (hotel_id);

-- Primary Key (Sales Table)
ALTER TABLE oyo_sales_csv
ADD PRIMARY KEY (booking_id);

-- Foreign Key Relationship
ALTER TABLE oyo_sales_csv
ADD FOREIGN KEY (hotel_id)
REFERENCES oyo_city_csv(hotel_id);
