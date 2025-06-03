with 

source as (

    select * from {{ source('f1_raw', 'races_fastest_laps') }}

),

renamed as (

    select

    from source

)

select * from renamed
