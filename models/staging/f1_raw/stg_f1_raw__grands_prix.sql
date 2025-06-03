with 

source as (

    select * from {{ source('f1_raw', 'grands_prix') }}

),

renamed as (

    select

    from source

)

select * from renamed
