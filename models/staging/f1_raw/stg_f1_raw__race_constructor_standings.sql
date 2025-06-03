with 

source as (

    select * from {{ source('f1_raw', 'race_constructor_standings') }}

),

renamed as (

    select

    from source

)

select * from renamed
