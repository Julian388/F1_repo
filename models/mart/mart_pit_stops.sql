{{ config(
    materialized = 'table',
    description = 'Pit stop data filtered for races between 2018 and 2025'
) }}

with pit_stops as (

    select * 
    from {{ ref('int_pit_stops') }}
    where year between 2018 and 2025

)

select *
from pit_stops
order by year desc, round, pit_stop_number
