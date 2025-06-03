with 

source as (

    select * from {{ source('python_dataset', 'races_race_results') }}

),

renamed as (

    select
        raceid as race_id,
        year,
        round,
        positionnumber as position_number,
        drivernumber as driver_number,
        driverid as driver_id,
        constructorid as constructor_id,
        laps,
        `time`,
        timemillis as time_millis,
        timepenalty as time_penalty,
        timepenaltymillis as time_penalty_millis,
        gap,
        gapmillis as gap_millis,
        gaplaps as gap_laps,
        reasonretired as reason_retired,
        points,
        poleposition as pole_position,
        qualificationpositionnumber as qualification_position_number,
        gridpositionnumber as grid_position_number,
        positionsgained as positions_gained,
        pitstops as pit_stops,
        fastestlap as fastest_lap,

    from source

)

select * from renamed
