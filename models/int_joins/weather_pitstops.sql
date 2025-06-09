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
  P. pit_in_time as pit_time,
  P.pitstop_nb,
  p.lap_number as lap_nb,
  p.tyre_type,
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
  END AS track_status,
  

FROM {{ ref('int_races_weather') }} as w
LEFT JOIN {{ ref('int_pitstops_2018_2025') }} as p
  ON w.gp_id = p.gp_id -- key créée pour lier les tables
  AND ABS(TIMESTAMP_DIFF(DATETIME('2025-01-01', w.time), DATETIME('2025-01-01', p.pit_in_time), SECOND)) <= 30 -- on prend la différence absolue entre la date et le time de pitstops pour pouvoir les liers lorsque la différence est moins de 30 sec 
LEFT JOIN {{ ref('race_grid_results') }} as gr ON p.gp_driver_abb_id = gr.gp_driver_abb_id
LEFT JOIN {{ ref('mart_races_grid_results') }} as mrs ON gr.gp_id = mrs.gp_id
ORDER BY
  p.year DESC, p.round ASC, w.time ASC