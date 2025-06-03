with 

source as (

    select * from {{ source('f1_raw', 'races_driver_standings') }}

),

renamed as (

    select

    from source

)

select * from renamed
