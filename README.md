# hw1\_idb MySQL Sample Database

Ця базаданих моделює характеристики автомобілів 1990-х років (бренди Volvo, Saab, Mitsubishi, Nissan, Honda). Також включено приклади запитів для роботи з цією базою.

## Структура файлів

* **create\_tables.sql**
  Скрипт для створення п’яти таблиць:

  1. `manufacturers` — виробники автомобілів
  2. `models`        — моделі
  3. `engines`       — специфікації двигунів
  4. `transmissions` — коробки передач
  5. `features`      — додаткові фічі й опції

* **insert\_data.sql**
  Скрипт для наповнення таблиць реалістичними даними (по 5–10 записів кожна) з прикладами моделей і їх характеристик.

* **queries.sql**
  Приклади типових запитів:

  * Вибірка моделей за роком старту випуску
  * Об’єднання (JOIN) даних п’яти таблиць
  * Агрегація з використанням `GROUP BY`, `HAVING` та `ORDER BY`
  * Використання `UNION` і `LIMIT`

## Приклади використання

### Швидке вивантаження всіх моделей бренду з 1990 року:

```sql
SELECT man.name, m.model_name
FROM manufacturers AS man
JOIN models AS m ON man.manufacturer_id = m.manufacturer_id
WHERE m.year_start >= 1990;
```

### Середня потужність двигунів по бренду:

```sql
SELECT man.name AS brand, AVG(e.horsepower) AS avg_hp
FROM engines AS e
JOIN models AS m ON e.model_id = m.model_id
JOIN manufacturers AS man ON m.manufacturer_id = man.manufacturer_id
GROUP BY man.name
ORDER BY avg_hp DESC;
```

### Об’єднання брендів та моделей через `UNION`:

```sql
SELECT name AS item_name, 'Manufacturer' AS item_type
FROM manufacturers
UNION
SELECT model_name AS item_name, 'Model' AS item_type
FROM models;
```

