with 

source as (

    select * from {{ source('python_dataset', 'race_constructor_standings') }}

),

renamed as (

    select
        year,
        positiondisplayorder as position_display_order,
        positionnumber as position_number,
        positiontext as position_text,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacture_id,
        points

    from source

)

select * from renamed
