SELECT
id
, year
, round
, SAFE.PARSE_DATE('%Y-%m-%d', date) AS date
, grand_prix_id
, qualifying_format
, sprint_qualifying_format
, circuit_id
, circuit_type
, turns
, laps
, drivers_championship_decider
, constructors_championship_decider
, country_code_alpha2

FROM {{ ref('stg_python_dataset__races_with_context') }}
order by year DESC, round ASC