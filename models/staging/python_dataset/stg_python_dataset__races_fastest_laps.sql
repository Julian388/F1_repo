with 

source as (

    select * from {{ source('python_dataset', 'races_fastest_laps') }}

),

renamed as (

    select
        raceid as race_id,
        year,
        round,
        positiondisplayorder position_display_order,
        positionnumber as position_number,
        positiontext as position_text,
        drivernumber as driver_number,
        driverid as driver_id,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacturer_id,
        tyremanufacturerid as tyre_manufacturer_id,
        lap,
        `time`,
        timemillis as time_millis,
        gap,
        gapmillis as gap_millis,
        `interval`,
        intervalmillis as interval_millis

    from source

)

select * from renamed
