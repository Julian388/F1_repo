{{ config(
    materialized = 'table',
    description = 'Sprint merged results from 2018 to 2025'
) }}

with sprint_results as (
    select * 
    from {{ ref('int_sprints_results') }}
    where year between 2018 and 2025
)

select *
from sprint_results
order by year desc, round, position_number_qualifying
