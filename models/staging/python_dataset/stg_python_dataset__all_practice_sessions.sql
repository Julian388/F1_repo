with 

source as (

    select * from {{ source('python_dataset', 'all_practice_sessions') }}

),

renamed as (

    select
        raceId as race_id,
        year,
        round,
        positionNumber as position_number,
        driverNumber as driver_number,
        driverId as driver_id,
        constructorId as constructor_id,
        `time`,
        timeMillis as time_millis,
        gap,
        gapMillis as gap_millis,
        `interval`,
        intervalMillis as interval_millis,
        laps,
        `session`

    from source

)

select * from renamed
