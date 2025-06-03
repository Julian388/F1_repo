with 

source as (

    select * from {{ source('python_dataset', 'seasons_entrants_drivers') }}

),

renamed as (

    select
        year,
        entrantid as entrant_id,
        constructorid as constructor_id,
        enginemanufacturerid as engine_manufacture_id,
        driverid as drive_id,
        rounds as rounds,
        roundstext as rounds_test,
        testdriver as test_driver

    from source

)

select * from renamed
