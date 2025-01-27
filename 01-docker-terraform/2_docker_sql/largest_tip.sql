SELECT
  z_drop.Zone AS dropoff_zone,
  MAX(t.tip_amount) AS largest_tip
FROM
  green_trip_data t
  JOIN taxi_zone_lookup z_pickup ON t.PULocationID = z_pickup.LocationID
  JOIN taxi_zone_lookup z_drop ON t.DOLocationID = z_drop.LocationID
WHERE
  t.lpep_pickup_datetime >= '2019-10-01'
  AND t.lpep_pickup_datetime < '2019-11-01'
  AND z_pickup.Zone = 'East Harlem North'
GROUP BY
  z_drop.Zone
ORDER BY
  largest_tip DESC
LIMIT
  5;