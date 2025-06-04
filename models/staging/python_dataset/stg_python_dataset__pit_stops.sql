with 

source as (

    select * from {{ source('python_dataset', 'pit_stops') }}

),

renamed as (

    select
        raceid,
        year,
        round,
        positionnumber as position_number,
        drivernumber as driver_number,
        driverid,
        constructorid as constructor_id,
        stop,
        lap,
        time

    from source

)

select * from renamed
