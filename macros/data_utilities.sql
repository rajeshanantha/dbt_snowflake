{% macro function1(x) %}

CASE WHEN MONTH (TO_TIMESTAMP({{ x }})) IN (1,2,3)
     THEN 'Q1'
     WHEN MONTH (TO_TIMESTAMP({{ x }})) IN (4,5,6)
     THEN 'Q2'
     WHEN MONTH (TO_TIMESTAMP({{ x }})) IN (7,8,9)
     THEN 'Q3'
     ELSE 'Q4'
END

{% endmacro %}


{% macro function2(x) %}
CASE WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat', 'Sun') 
   THEN 'WEEKEND'
   ELSE 'BUSINESSDAY'
END
{% endmacro %}
