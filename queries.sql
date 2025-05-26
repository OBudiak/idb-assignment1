use hw1_idb;

SELECT
  man.name,
  m.model_name
FROM manufacturers AS man
INNER JOIN models AS m
  ON man.manufacturer_id = m.manufacturer_id
WHERE
  m.year_start >= 1980;

SELECT
  man.name AS manufacturer,
  m.model_name AS model,
  e.engine_type AS engine_type,
  e.horsepower AS hp,
  t.type AS transmission_type,
  f.feature AS features
FROM manufacturers AS man
JOIN models AS m
  ON man.manufacturer_id = m.manufacturer_id
JOIN engines AS e
  ON m.model_id = e.model_id
JOIN transmissions AS t
  ON m.model_id = t.model_id
JOIN features AS f
  ON m.model_id = f.model_id
WHERE m.year_start >= 1990
ORDER BY
  hp desc;

select man.name as brand, e.engine_type as engine_type, AVG(e.horsepower) as average_hp
from engines e
JOIN models AS mo ON e.model_id = mo.model_id
JOIN manufacturers AS man ON mo.manufacturer_id = man.manufacturer_id
group by engine_type, man.name
order by average_hp desc;

select man.name as brand, AVG(e.displacement_cc) as average_displacement
from engines e
JOIN models AS mo ON e.model_id = mo.model_id
JOIN manufacturers AS man ON mo.manufacturer_id = man.manufacturer_id
group by brand
having average_displacement > 2000
order by average_displacement desc;


SELECT
  name AS item_name,
  'Brand' AS item_type
FROM manufacturers
union
SELECT
  model_name AS item_name,
  'Model'        AS item_type
FROM models;




-- doesn't works, but looks good, for next experiments

-- (select man.name as brand, mo.model_name as model, MAX(e.horsepower) as hp
-- from engines e
-- JOIN models AS mo ON e.model_id = mo.model_id
-- JOIN manufacturers AS man ON mo.manufacturer_id = man.manufacturer_id
-- group by brand, model)
-- union
-- (select mo.model_name as model, t.type as gearbox, f.feature as feature
-- from transmissions t
-- join models as mo on mo.model_id = t.model_id
-- join features as f on t.model_id = f.model_id
-- group by model, gearbox, feature)
-- order by hp desc
-- limit 3;