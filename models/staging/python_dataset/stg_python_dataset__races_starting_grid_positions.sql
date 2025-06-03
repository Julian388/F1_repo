with 

source as (

    select * from {{ source('python_dataset', 'races_starting_grid_positions') }}

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
        driverid as drive_id,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacture_id,
        tyremanufacturerid as tyre_manufacture_id,
        qualificationpositionnumber as qualification_position_number,
        qualificationpositiontext as qualification_position_text,
        gridpenalty as grid_penalty,
        gridpenaltypositions as grid_penalty_positions,
        `time`,
        timemillis as time_millis

    from source

)

select * from renamed
