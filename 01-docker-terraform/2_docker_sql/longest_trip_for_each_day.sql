SELECT
  DATE(lpep_pickup_datetime) AS pickup_day,
  MAX(trip_distance) AS longest_trip
FROM
  green_trip_data
GROUP BY
  DATE(lpep_pickup_datetime)
ORDER BY
  longest_trip DESC
LIMIT
  5;