{{ config(
    materialized = 'table',
    description = 'Driver race standings from 2018 to 2025'
) }}

with driver_standings as (

    select * 
    from {{ ref('int_races_driver_standings') }}
    where year between 2018 and 2025

)

select *
from driver_standings
order by year desc, round asc, position_number asc
