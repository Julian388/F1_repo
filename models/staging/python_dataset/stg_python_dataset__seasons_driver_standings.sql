with 

source as (

    select * from {{ source('python_dataset', 'seasons_driver_standings') }}

),

renamed as (

    select
        year,
        positiondisplayorder as position_display_order,
        positionnumber as position_number,
        positiontext as position_text,
        driverid as drive_id,
        points

    from source

)

select * from renamed
