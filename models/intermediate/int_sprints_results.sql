with source as (
    select * from {{ ref('stg_python_dataset__sprint_merged_results') }}
),

renamed as (
    select
        id as race_id,
        year,
        round,

        cast(position_number_qualifying as int64) as position_number_qualifying,
        driver_number,
        driver_id,
        constructor_id,

        case 
            when q1 is null 
                 or trim(cast(q1 as string)) = '' 
                 or lower(trim(cast(q1 as string))) = 'nan' then null
            when instr(cast(q1 as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(q1 as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(q1 as string)))
        end as q1,

        case 
            when q2 is null 
                 or trim(cast(q2 as string)) = '' 
                 or lower(trim(cast(q2 as string))) = 'nan' then null
            when instr(cast(q2 as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(q2 as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(q2 as string)))
        end as q2,

        case 
            when q3 is null 
                 or trim(cast(q3 as string)) = '' 
                 or lower(trim(cast(q3 as string))) = 'nan' then null
            when instr(cast(q3 as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(q3 as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(q3 as string)))
        end as q3,

        case
            when gap_qualifying is null 
                 or trim(cast(gap_qualifying as string)) = '' 
                 or lower(trim(cast(gap_qualifying as string))) = 'nan' then null
            when instr(cast(gap_qualifying as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(gap_qualifying as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(gap_qualifying as string)))
        end as gap_qualifying,

        cast(position_number_race as int64) as position_number_race,
        cast(laps_race as int64) as laps_race,

        case
            when time_race is null 
                 or trim(cast(time_race as string)) = '' 
                 or lower(trim(cast(time_race as string))) = 'nan' then null
            when instr(cast(time_race as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(time_race as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(time_race as string)))
        end as time_race,

        cast(time_penalty as int64) as time_penalty,

        interval_race,
        reason_retired,

        cast(points as int64) as points,
        cast(pole_position as int64) as pole_position,
        cast(qualification_position_number as int64) as qualification_position_number,
        cast(positions_gained as int64) as positions_gained,
        cast(fastest_lap as int64) as fastest_lap,
        cast(final_position_number as int64) as final_position_number,
        cast(qualif_position_nb_grid_gp as int64) as qualif_position_nb_grid_gp,
        cast(grid_penalty_positions as int64) as grid_penalty_positions,

        case
            when average_time is null 
                 or trim(cast(average_time as string)) = '' 
                 or lower(trim(cast(average_time as string))) = 'nan' then null
            when instr(cast(average_time as string), ':') > 0 then PARSE_TIME('%M:%E*S', cast(average_time as string))
            else PARSE_TIME('%H:%M:%E*S', CONCAT('00:00:', cast(average_time as string)))
        end as average_time

    from source
)

select * from renamed
order by year desc, round, position_number_qualifying