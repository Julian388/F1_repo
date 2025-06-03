with 

source as (

    select * from {{ source('python_dataset', 'seasons_entrants_drivers') }}

),

renamed as (

    select
        year,
        constructorid as constructor_id,
        driverid as driver_id,
        rounds as rounds,
        roundstext as rounds_test,
        testdriver as test_driver

    from source

)

select * from renamed
