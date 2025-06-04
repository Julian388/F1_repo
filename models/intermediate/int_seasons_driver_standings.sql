

SELECT 
  year,
  CAST (position_number AS INT64) AS position_number,
  drive_id,
  CAST (points AS INT64) AS points
FROM {{ ref('stg_python_dataset__seasons_driver_standings') }}
ORDER BY year DESC, position_number ASC
