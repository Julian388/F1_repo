with 

source as (

    select * from {{ source('python_dataset', 'races_starting_grid_positions') }}

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
        qualificationpositionnumber as qualification_position_number,
        gridpenaltypositions as grid_penalty_positions,
        `time`,
        timemillis as time_millis

    from source

)

select * from renamed
