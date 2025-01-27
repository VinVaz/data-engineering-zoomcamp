SELECT
  z.Zone AS pickup_zone,
  SUM(t.total_amount) AS total_revenue
FROM
  green_trip_data t
  JOIN taxi_zone_lookup z ON t.PULocationID = z.LocationID
WHERE
  t.lpep_pickup_datetime >= '2019-10-18'
  AND t.lpep_pickup_datetime < '2019-10-19'
GROUP BY
  z.Zone
HAVING
  SUM(t.total_amount) > 13000
ORDER BY
  total_revenue DESC;