with 

source as (

    select * from {{ source('python_dataset', 'races_fastest_laps') }}

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
        lap,
        `time`,
        timemillis as time_millis,
        gap,
        gapmillis as gap_millis,

    from source

)

select * from renamed
