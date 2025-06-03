with source as (
    select * from {{ source('python_dataset', 'sprint_merged_results') }}
),

renamed as (
    select
        raceid as id,
        year,
        round,
        positionnumber_qualifying as position_number_qualifying,
        drivernumber as driver_number,
        driverid as driver_id,
        constructorid as constructor_id,
        q1,
        q1millis as q1_millis,
        q2,
        q2millis as q2_millis,
        q3,
        q3millis as q3_millis,
        gap_qualifying,
        gapmillis_qualifying as gap_millis_qualifying,
        positionnumber_race as position_number_race,
        laps_race,
        time_race,
        timemillis_race as time_millis_race,
        timepenalty as time_penalty,
        timepenaltymillis as time_penalty_millis,
        gap_race,
        gapmillis_race as gap_millis_race,
        interval_race,
        intervalmillis_race as interval_millis_race,
        reasonretired as reason_retired,
        points,
        poleposition as pole_position,
        qualificationpositionnumber as qualification_position_number,
        positionsgained as positions_gained,
        pitstops as pit_stops,
        fastestlap as fastest_lap,
        positionnumber as final_position_number,
        qualificationpositionnumber_grid as qualification_position_number_grid,
        gridpenalty as grid_penalty,
        gridpenaltypositions as grid_penalty_positions,
        time as final_time,
        timemillis as final_time_millis
    from source
)

select * from renamed
