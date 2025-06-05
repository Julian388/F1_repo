with source as (
    select * from {{ ref('stg_python_dataset__pit_stops') }}
),

renamed as (
    select
        raceid as race_id,
        year,
        round,
        position_number,
        driver_number,
        driverid as driver_id,
        constructor_id,
        stop as pit_stop_number,
        lap,
        CASE 
            WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+(\.\d+)?$') THEN CAST(time AS FLOAT64)
            WHEN REGEXP_CONTAINS(CAST(time AS STRING), r'^\d+:\d+\.\d+$') THEN
                CAST(SPLIT(time, ':')[OFFSET(0)] AS INT64) * 60 +
                CAST(SPLIT(SPLIT(time, ':')[OFFSET(1)], '.')[OFFSET(0)] AS INT64) +
                CAST(SPLIT(time, '.')[OFFSET(1)] AS FLOAT64) / 1000
            ELSE NULL
        END AS time
    from source
)

select * from renamed
order by year desc, round , pit_stop_number
