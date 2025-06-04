with source as (
    select * from {{ ref('stg_python_dataset__all_practice_sessions') }}
)

select
    race_id,
    year,
    round,
    position_number,
    driver_number,
    driver_id,
    constructor_id,

    -- Parse `time`
    case
        when `time` is null or REGEXP_REPLACE(`time`, r'^\+', '') = '' then null
        when instr(`time`, ':') > 0 then 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:', REGEXP_REPLACE(`time`, r'^\+', '')))
        else 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', REGEXP_REPLACE(`time`, r'^\+', '')))
    end as time,

    time_millis,

    -- Parse `gap`
    case
        when gap is null or REGEXP_REPLACE(gap, r'^\+', '') = '' then null
        when instr(gap, ':') > 0 then 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:', REGEXP_REPLACE(gap, r'^\+', '')))
        else 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', REGEXP_REPLACE(gap, r'^\+', '')))
    end as gap,

    gap_millis,

    -- Parse `interval`
    case
        when `interval` is null or REGEXP_REPLACE(`interval`, r'^\+', '') = '' then null
        when instr(`interval`, ':') > 0 then 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:', REGEXP_REPLACE(`interval`, r'^\+', '')))
        else 
            PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', REGEXP_REPLACE(`interval`, r'^\+', '')))
    end as interval_time,

    interval_millis,
    laps,
    session

from source
order by year desc, round, position_number
