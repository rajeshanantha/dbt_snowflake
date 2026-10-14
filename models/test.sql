select 
* 
from {{ source('dbtdemo', 'bike') }}

limit 10