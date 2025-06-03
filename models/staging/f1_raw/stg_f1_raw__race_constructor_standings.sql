with 

source as (

    select * from {{ source('python_dataset', 'race_constructor_standings') }}

),

renamed as (

    select
        raceid as race_id,
        year,
        round,
        positiondisplayorder as position_display_order,
        positionnumber as position_number,
        positiontext as position_text,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacturer_id,
        points,
        positionsgained as positions_gained

    from source

)

select * from renamed
