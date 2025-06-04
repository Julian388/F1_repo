with 

source as (

    select * from {{ source('python_dataset', 'pitstops_2018_2025') }}

),

renamed as (

    select
        driver,
        compound as tyre_type,
        tyrelife as tyre_life,
        lapnumber as lap_number,
        stintnumber as pitstop_nb,
        season,
        round,
        pitintime as pit_in_time,
        pitouttime as pit_out_time,
        trackstatus as track_status

    from source

)

select * from renamed
