{{ config(
    materialized = 'table',
    description = 'Constructor race standings from 2018 to 2025'
) }}

with constructor_standings as (

    select * 
    from {{ ref('int_race_constructor_standings') }}
    where year between 2018 and 2025

)

select *
from constructor_standings
order by year desc, round asc, position_number asc
