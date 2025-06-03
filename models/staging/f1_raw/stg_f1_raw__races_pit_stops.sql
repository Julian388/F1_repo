with 

source as (

    select * from {{ source('f1_raw', 'races_pit_stops') }}

),

renamed as (

    select

    from source

)

select * from renamed
