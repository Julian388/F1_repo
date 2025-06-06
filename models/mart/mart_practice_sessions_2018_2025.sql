with source as (
    select * from {{ ref('int_practice_sessions') }}
)

select
    race_id,
    year,
    round,
    position_number,
    driver_number,
    driver_id,
    constructor_id,
    time,
    time_millis,
    gap,
    gap_millis,
    interval_time,
    interval_millis,
    laps,
    session

from source
order by year desc, round, position_number
