with 

source as (

    select * from {{ source('python_dataset', 'weather_2018_2025') }}

),

renamed as (

    select
        time,
        airtemp as air_temp,
        humidity,
        pressure,
        rainfall,
        tracktemp as track_temp,
        winddirection as wind_direction,
        windspeed as wind_speeed,
        `round number` as round_number,
        year

    from source

)

select * from renamed
