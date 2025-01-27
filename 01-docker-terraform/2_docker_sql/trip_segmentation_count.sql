/* Up to 1 mile */
SELECT
  COUNT(*) AS trips_up_to_1_mile
FROM
  green_trip_data
WHERE
  trip_distance <= 1
  AND lpep_pickup_datetime >= '2019-10-01'
  AND lpep_pickup_datetime < '2019-11-01';

/* In between 1 (exclusive) and 3 miles (inclusive) */
SELECT
  COUNT(*) AS trips_1_to_3_miles
FROM
  green_trip_data
WHERE
  trip_distance > 1
  AND trip_distance <= 3
  AND lpep_pickup_datetime >= '2019-10-01'
  AND lpep_pickup_datetime < '2019-11-01';

/* In between 3 (exclusive) and 7 miles (inclusive) */
SELECT
  COUNT(*) AS trips_3_to_7_miles
FROM
  green_trip_data
WHERE
  trip_distance > 3
  AND trip_distance <= 7
  AND lpep_pickup_datetime >= '2019-10-01'
  AND lpep_pickup_datetime < '2019-11-01';

/* In between 7 (exclusive) and 10 miles (inclusive) */
SELECT
  COUNT(*) AS trips_7_to_10_miles
FROM
  green_trip_data
WHERE
  trip_distance > 7
  AND trip_distance <= 10
  AND lpep_pickup_datetime >= '2019-10-01'
  AND lpep_pickup_datetime < '2019-11-01';

/* Over 10 miles */
SELECT
  COUNT(*) AS trips_over_10_miles
FROM
  green_trip_data
WHERE
  trip_distance > 10
  AND lpep_pickup_datetime >= '2019-10-01'
  AND lpep_pickup_datetime < '2019-11-01';