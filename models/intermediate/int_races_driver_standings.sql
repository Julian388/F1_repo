SELECT
 race_id,
 year,
 round,
 CAST(position_number AS INT64) AS position_number,
 driver_id,
 CAST(points AS INT64) AS points,
 CAST(positions_gained AS INT64) AS positions_gained,
FROM {{ ref('stg_python_dataset__races_driver_standings') }}
ORDER BY year DESC, round ASC, position_number ASC