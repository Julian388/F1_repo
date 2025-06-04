with source as (
    select * from {{ ref('stg_python_dataset__races_starting_grid_positions') }}
)

select
    race_id,
    year,
    round,
    cast(position_number as int64) as position_number,
    driver_number,
    driver_id,
    constructor_id,
    cast(qualification_position_number as int64) as qualification_position_number,
    cast(grid_penalty_positions as int64) as grid_penalty_positions,

    case
        when time is null or trim(time) = '' then null
        when instr(time, ':') > 0 then PARSE_TIME('%M:%E*S', time)
        else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', time))
    end as time,

    cast(time_millis as int64) as time_millis

from source

order by year desc, round, position_number
