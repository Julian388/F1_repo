


SELECT 
year,
constructor_id,
driver_id,
rounds,
rounds_test,
test_driver

FROM {{ ref('stg_python_dataset__seasons_entrants_drivers') }}

ORDER BY year DESC, rounds ASC