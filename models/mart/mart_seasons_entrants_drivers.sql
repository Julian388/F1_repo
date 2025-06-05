{{ config(
    materialized = 'table',
    description = 'Entrants drivers data by season from 2018 to 2025'
) }}

with entrants_drivers as (

    select * 
    from {{ ref('int_seasons_entrants_drivers') }}
    where year between 2018 and 2025

)

select *
from entrants_drivers
order by year desc, rounds asc
