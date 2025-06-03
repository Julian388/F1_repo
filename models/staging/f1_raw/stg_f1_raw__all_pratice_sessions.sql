with 

source as (

    select * from {{ source('python_dataset', 'all_practice_sessions') }}

),

renamed as (

    select
        raceid,
        year,
        round,
        positiondisplayorder,
        positionnumber,
        positiontext,
        drivernumber,
        driverid,
        constructorid,
        enginemanufacturerid,
        tyremanufacturerid,
        `time`,
        timemillis,
        gap,
        gapmillis,
        `interval`,
        intervalmillis,
        laps,
        `session`

    from source

)

select * from renamed
