WITH bike AS (

select 
distinct 
START_STATIO_ID as station_id,
START_STATION_NAME as station_name,
START_LAT as station_lat,
START_LNG as station_long

from {{ source('dbtdemo', 'bike') }}


)

SELECT * FROM bike
