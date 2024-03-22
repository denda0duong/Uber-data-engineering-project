select VendorID, passenger_count_id from `uber-data-etl-417706.uber_data_engineering_dataset.fact_table` limit 10;

-- Average tip amount upon different payment types
SELECT b.payment_type_name, AVG(f.tip_amount) FROM `uber-data-etl-417706.uber_data_engineering_dataset.fact_table` f
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.payment_type_dim` b
ON f.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

-- Find the top 10 pick-up locations based on the number of trips
SELECT a.pickup_location_id, a.pickup_latitude, a.pickup_latitude, COUNT(f.VendorID) as num_pickups FROM `uber-data-etl-417706.uber_data_engineering_dataset.pickup_location_dim` a
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.fact_table` f
ON a.pickup_location_id = f.pickup_location_id
GROUP BY a.pickup_location_id, a.pickup_latitude, a.pickup_latitude
ORDER BY num_pickups DESC
LIMIT 10;

-- Find the total number of trips by passenger count
SELECT c.passenger_count, COUNT(f.passenger_count_id) as num_trips FROM `uber-data-etl-417706.uber_data_engineering_dataset.fact_table` f
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.passenger_count_dim` c
ON f.passenger_count_id = c.passenger_count_id
GROUP BY c.passenger_count
ORDER BY num_trips DESC

-- Find the average fare amount by hour of the day
SELECT d.pick_hour, AVG(f.fare_amount) FROM `uber-data-etl-417706.uber_data_engineering_dataset.fact_table` f
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.datetime_dim` d
ON f.datetime_id = d.datetime_id
GROUP BY d.pick_hour
ORDER BY d.pick_hour ASC


