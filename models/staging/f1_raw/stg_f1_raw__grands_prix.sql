with 

source as (

    select * from {{ source('f1_raw', 'grands_prix') }}

),

renamed as (

    select
        id,
        name,
        fullname,
        shortname,
        abbreviation,
        countryid,
        totalracesheld

    from source

)

select * from renamed
