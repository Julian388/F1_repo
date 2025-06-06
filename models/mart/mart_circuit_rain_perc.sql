select
    grand_prix_id,
    COUNT(*) AS total_gp,
    COUNTIF(pf.rain_flag = TRUE) AS nb_gp_rain,
    ROUND(100 * COUNTIF(pf.rain_flag = TRUE) / COUNT(*), 1) AS rain_perc
    FROM {{ ref('int_races') }} r
    JOIN {{ ref('int_weather_flag_races') }} pf ON r.race_key = pf.race_key
    WHERE r.year BETWEEN 2018 AND 2025
    GROUP BY grand_prix_id