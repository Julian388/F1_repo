{{ config(
    materialized = 'table',
    description = 'Race context data (e.g. circuits, formats, championship impact) from 2018 to 2025'
) }}

with race_context as (

    select
    *,
    FROM {{ ref('int_races') }}
    WHERE year BETWEEN 2018 AND 2025
  
)

select *
from race_context
order by year desc, round asc
