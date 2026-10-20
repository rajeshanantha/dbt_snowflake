WITH WBC AS (

SELECT 
t.*,
w.*
FROM {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.trip_date = w.daily_weather


)

SELECT 
*
FROM WBC