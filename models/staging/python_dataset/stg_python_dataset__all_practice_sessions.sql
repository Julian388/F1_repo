with source as (
    select * from {{ source('python_dataset', 'all_practice_sessions') }}
),

renamed as (
    select
        `Row` as row_number,
        raceId as race_id,
        year,
        round,
        positionDisplayOrder as position_display_order,
        positionNumber as position_number,
        positionText as position_text,
        driverNumber as driver_number,
        driverId as driver_id,
        constructorId as constructor_id,
        engineManufacturerId as engine_manufacturer_id,
        tyreManufacturerId as tyre_manufacturer_id,
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

