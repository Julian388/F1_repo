{{ config(
    materialized = 'table',
    description = 'Season performance stats for drivers from 2018 to 2025'
) }}

with seasons_drivers as (

    select * 
    from {{ ref('int_seasons_drivers') }}
    where year between 2018 and 2025

)

select *
from seasons_drivers
order by year desc, position_number asc
