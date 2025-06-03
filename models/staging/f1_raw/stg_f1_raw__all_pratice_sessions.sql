with 

source as (

    select * from {{ source('f1_raw', 'all_pratice_sessions') }}

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
