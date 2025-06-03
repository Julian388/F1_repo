with 

source as (

    select * from {{ source('python_dataset', 'races_driver_standings') }}

),

renamed as (

    select
        raceid as race_id,
        year,
        round,
        positionnumber as position_number,
        driverid as driver_id,
        points,
        positionsgained as positions_gained

    from source

)

select * from renamed
