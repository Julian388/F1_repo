{{ config(
    materialized = 'table',
    description = 'Starting grid positions from 2018 to 2025 with time and penalties'
) }}

with starting_grid as (

    select * 
    from {{ ref('int_races_starting_grid_positions') }}
    where year between 2018 and 2025

)

select *
from starting_grid
order by year desc, round asc, position_number asc
