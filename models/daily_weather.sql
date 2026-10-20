WITH weather AS (
SELECT 
DATE(TO_TIMESTAMP(time)) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds 
from {{ source('dbtdemo', 'weather') }}
),

weather_agg as (
    select 
    daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidiy,
    round(avg(clouds),2) as avg_clouds
from weather
group by daily_weather, weather

qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather)desc ) = 1

)

SELECT 
* 
FROM weather_agg
