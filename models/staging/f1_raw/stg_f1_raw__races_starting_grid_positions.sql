with 

source as (

    select * from {{ source('f1_raw', 'races_starting_grid_positions') }}

),

renamed as (

    select

    from source

)

select * from renamed

