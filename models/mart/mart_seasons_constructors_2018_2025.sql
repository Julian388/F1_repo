{{ config(
    materialized = 'table',
    description = 'Season summary for constructors from 2018 to 2025'
) }}

with seasons_constructors as (

    select * 
    from {{ ref('int_seasons_constructors') }}
    where year between 2018 and 2025

)

select *
from seasons_constructors
order by year desc, position_number asc
