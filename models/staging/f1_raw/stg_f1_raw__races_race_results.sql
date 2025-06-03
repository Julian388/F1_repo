with 

source as (

    select * from {{ source('python_dataset', 'races_race_results') }}

),

renamed as (

    select

    from source

)

select * from renamed
