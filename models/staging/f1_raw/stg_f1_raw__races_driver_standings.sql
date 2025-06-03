with 

source as (

    select * from {{ source('python_dataset', 'races_driver_standings') }}

),

renamed as (

    select

    from source

)

select * from renamed
