WITH TRIPS AS (
select 
ride_id,
DATE(TO_TIMESTAMP(started_at)) as TRIP_DATE,
start_station_id,
end_station_id,
TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) as TRIP_DURATION_SECONDS
from 
{{ ref('stage_bike') }}
)

select *
from TRIPS