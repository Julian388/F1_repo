{{ config(
    materialized = 'table',
    description = 'Fastest race laps from 2018 to 2025'
) }}

with fastest_laps as (

    select * 
    from {{ ref('int_races_fastest_laps') }}
    where year between 2018 and 2025

)

select *
from fastest_laps
order by year desc, round asc
