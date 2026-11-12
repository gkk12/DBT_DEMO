WITH TRIPS AS (
select 
ride_id
rideable_type,
DATE(TO_TIMESTAMP(started_at)) as TRIP_DATE,
start_station_id,
end_station_id,
member_casual,
TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) as TRIP_DURATION_SECONDS
from 
{{ source('another_demo', 'BIKE') }}
where ride_id != 'ride_id'
)

select *
from TRIPS