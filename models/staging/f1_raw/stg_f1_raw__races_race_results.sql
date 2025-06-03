with 

source as (

    select * from {{ source('f1_raw', 'races_race_results') }}

),

renamed as (

    select

    from source

)

select * from renamed
