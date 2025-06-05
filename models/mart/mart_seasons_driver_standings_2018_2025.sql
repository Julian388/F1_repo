{{ config(
    materialized = 'table',
    description = 'Season standings for drivers from 2018 to 2025'
) }}

with seasons_driver_standings as (

    select * 
    from {{ ref('int_seasons_driver_standings') }}
    where year between 2018 and 2025

)

select *
from seasons_driver_standings
order by year desc, position_number asc
