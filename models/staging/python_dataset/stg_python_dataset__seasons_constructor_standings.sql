with 

source as (

    select * from {{ source('python_dataset', 'seasons_constructor_standings') }}

),

renamed as (

    select
        year,
        positionnumber as position_number,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacture_id,
        points

    from source

)

select * from renamed
