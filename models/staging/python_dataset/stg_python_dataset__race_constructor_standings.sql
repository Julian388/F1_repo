with 

source as (

    select * from {{ source('python_dataset', 'race_constructor_standings') }}

),

renamed as (

    select
        raceid,
        year,
        round,
        positionnumber as position_number,
        constructorid as constructor_id,
        points,
        positionsgained as positions_gained

    from source

)

select * from renamed
