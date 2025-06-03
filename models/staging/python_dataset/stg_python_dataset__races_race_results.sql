with 

source as (

    select * from {{ source('python_dataset', 'races_race_results') }}

),

renamed as (

    select
        raceid as race_id,
        year,
        round,
        positiondisplayorder as position_display_order,
        positionnumber as position_number,
        positiontext as position_text,
        drivernumber as driver_number,
        driverid as driver_id,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacturer_id,
        tyremanufacturerid as tyre_manufacturer_id,
        sharedcar as shared_car,
        laps,
        `time`,
        timemillis as time_millis,
        timepenalty as time_penalty,
        timepenaltymillis as time_penalty_millis,
        gap,
        gapmillis as gap_millis,
        gaplaps as gap_laps,
        `interval`,
        intervalmillis as interval_millis,
        reasonretired as reason_retired,
        points,
        poleposition as pole_position,
        qualificationpositionnumber as qualification_position_number,
        qualificationpositiontext as qualification_position_text,
        gridpositionnumber as grid_position_number,
        gridpositiontext as grid_position_text,
        positionsgained as positions_gained,
        pitstops as pit_stops,
        fastestlap as fastest_lap,
        driveroftheday as driver_of_the_day,
        grandslam as grand_slam

    from source

)

select * from renamed
