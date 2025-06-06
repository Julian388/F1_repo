{{ config(
    materialized = 'table',
    description = 'weather per minute filtered for races between 2018 and 2025'
) }}

with weather as (

    select * 
    from {{ ref('int_races_weather') }}

)

select *
from weather
order by year desc, round_number