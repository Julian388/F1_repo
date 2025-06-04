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
        q2,
        q3,
        gap_qualifying,
        positionnumber_race as position_number_race,
        laps_race,
        time_race,
        timepenalty as time_penalty,
        gap_race,
        interval_race,
        reasonretired as reason_retired,
        points,
        poleposition as pole_position,
        qualificationpositionnumber as qualification_position_number,
        positionsgained as positions_gained,
        fastestlap as fastest_lap,
        positionnumber as final_position_number,
        qualificationpositionnumber_grid as qualif_position_nb_grid_gp,
        gridpenaltypositions as grid_penalty_positions,
        time as average_time,
    from source
)

select * from renamed
