with 

source as (

    select * from {{ source('python_dataset', 'grands_prix') }}

),

renamed as (

    select
        id,
        name,
        fullname,
        shortname,
        abbreviation,
        countryid as country_id,
        totalracesheld

    from source

)

select * from renamed
