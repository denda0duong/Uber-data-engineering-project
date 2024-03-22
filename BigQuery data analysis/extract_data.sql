CREATE OR REPLACE TABLE `uber-data-etl-417706.uber_data_engineering_dataset.tbl_analytics` AS (

SELECT 
ft.VendorID,
dt.tpep_pickup_datetime,
dt.tpep_dropoff_datetime,
pc.passenger_count,
td.trip_distance,
rc.rate_code_name,
pl.pickup_latitude, pl.pickup_longitude,
dl.dropoff_latitude, dl.dropoff_longitude,
pt.payment_type_name,
ft.fare_amount,
ft.extra,
ft.mta_tax,
ft.tip_amount,
ft.tolls_amount,
ft.improvement_surcharge,
ft.total_amount


FROM 
`uber-data-etl-417706.uber_data_engineering_dataset.fact_table` ft
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.datetime_dim` dt ON ft.datetime_id = dt.datetime_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.passenger_count_dim` pc ON ft.passenger_count_id = pc.passenger_count_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.trip_distance_dim` td ON ft.trip_distance_id = td.trip_distance_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.rate_code_dim` rc ON ft.rate_code_id = rc.rate_code_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.pickup_location_dim` pl ON ft.pickup_location_id = pl.pickup_location_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.dropoff_location_dim` dl ON ft.dropoff_location_id = dl.dropoff_location_id
JOIN `uber-data-etl-417706.uber_data_engineering_dataset.payment_type_dim` pt ON ft.payment_type_id = pt.payment_type_id);
