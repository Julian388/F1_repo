{{ config(
    materialized = 'table',
    description = 'Race context data (e.g. circuits, formats, championship impact) from 2018 to 2025'
) }}

with race_context as (

    select * 
    from {{ ref('int_races') }}
    where year between 2018 and 2025

)

select *
from race_context
order by year desc, round asc
