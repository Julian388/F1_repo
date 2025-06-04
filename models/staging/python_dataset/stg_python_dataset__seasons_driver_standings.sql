with 

source as (

    select * from {{ source('python_dataset', 'seasons_driver_standings') }}

),

renamed as (

    select
        year,
        positionnumber as position_number,
        driverid as driver_id,
        points

    from source

)

select * from renamed
