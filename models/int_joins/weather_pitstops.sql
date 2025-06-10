WITH weather_pitstop as (
  SELECT
    w.year,
    p.round,
    gr.gp_id,
    mrs.country_code_alpha2,
    mrs.grand_prix_id,
    mrs.circuit_id,
    mrs.circuit_type,
    w.time,
    w.rainfall,
    w.track_temp,
    gr.driver_id,
    p.driver,
    p.gp_driver_abb_id,
    P.pit_in_time as pit_time,
    P.pitstop_nb,
    p.lap_number as lap_nb,
    CASE
      WHEN p.tyre_type = 'MEDIUM' THEN 'MEDIUM'
      WHEN p.tyre_type ='SOFT' THEN 'SOFT'
      WHEN p.tyre_type ='SUPERSOFT' THEN 'SOFT'
      WHEN p.tyre_type ='ULTRASOFT' THEN 'SOFT'
      WHEN p.tyre_type ='HYPERSOFT' THEN 'SOFT'
      WHEN p.tyre_type = 'HARD' THEN 'HARD'
      WHEN p.tyre_type = 'INTERMEDIATE' THEN 'INTERMEDIATE'
      WHEN p.tyre_type = 'WET' THEN 'WET'
      ELSE ""
    END AS tyre_type,
    P.tyre_life,
    gr.positions_gained,
    gr.race_position,
    gr.race_time,
    gr.race_time_millis,
    gr.reason_retired,
    CASE
      WHEN LEFT(CAST(track_status AS STRING), 1) = '1' THEN 'AllClear'
      WHEN LEFT(CAST(track_status AS STRING), 1) = '2' THEN 'Yellow'
      WHEN LEFT(CAST(track_status AS STRING), 1) = '5' THEN 'Red'
      WHEN LEFT(CAST(track_status AS STRING), 1) = '6' THEN 'VSCDeployed'
      WHEN LEFT(CAST(track_status AS STRING), 1) = '7' THEN 'VSCEnding'
      ELSE 'Start'
    END AS track_status
  FROM {{ ref('int_races_weather') }} as w
  LEFT JOIN {{ ref('int_pitstops_2018_2025') }} as p
    ON w.gp_id = p.gp_id
    AND ABS(TIMESTAMP_DIFF(DATETIME('2025-01-01', w.time), DATETIME('2025-01-01', p.pit_in_time), SECOND)) <= 30
  LEFT JOIN {{ ref('race_grid_results') }} as gr ON p.gp_driver_abb_id = gr.gp_driver_abb_id
  LEFT JOIN {{ ref('mart_races_grid_results') }} as mrs ON gr.gp_id = mrs.gp_id
  ORDER BY p.year DESC, p.round ASC, w.time ASC
),

drop_duplicates as (
  SELECT
    year, round, gp_id, country_code_alpha2, grand_prix_id, circuit_id, circuit_type,
    time, rainfall, track_temp, driver_id, driver, gp_driver_abb_id, pit_time,
    pitstop_nb, lap_nb, tyre_type, tyre_life, positions_gained, race_position,
    race_time, race_time_millis, reason_retired, track_status,
    ROW_NUMBER() OVER(
      PARTITION BY 
        year, round, gp_id, country_code_alpha2, grand_prix_id, circuit_id, circuit_type,
        time, driver_id, driver, gp_driver_abb_id, pit_time,
        pitstop_nb, lap_nb, tyre_type, race_time_millis, reason_retired, track_status
        -- Colonnes FLOAT64 exclues : rainfall, track_temp, tyre_life, positions_gained, race_time
      ORDER BY gp_id, time, driver_id, pitstop_nb
    ) as RN
  FROM weather_pitstop
)
SELECT *
FROM drop_duplicates
WHERE RN = 1 AND driver_id IS NOT NULL
ORDER BY gp_id, driver_id, pitstop_nb

