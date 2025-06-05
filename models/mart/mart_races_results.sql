{{ config(
    materialized = 'table',
    description = 'Race results from 2018 to 2025, including times, penalties, and driver metrics'
) }}

with race_results as (

    select * 
    from {{ ref('int_races_results') }}
    where year between 2018 and 2025

)

select *
from race_results
order by year desc, round asc
