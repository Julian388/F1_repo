with 

source as (

    select * from {{ source('python_dataset', 'races_starting_grid_positions') }}

),

renamed as (

    select

    from source

)

select * from renamed
