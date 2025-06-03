with 

source as (

    select * from {{ source('python_dataset', 'races_fastest_laps') }}

),

renamed as (

    select

    from source

)

select * from renamed
