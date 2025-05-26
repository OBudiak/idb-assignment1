# hw1\_idb MySQL Sample Database

Цей проєкт містить набір SQL-скриптів для створення та заповнення демонстраційної бази даних `hw1_idb`, що моделює характеристики автомобілів 1990-х років (бренди Volvo, Saab, Mitsubishi, Nissan, Honda). Також включено приклади запитів для роботи з цією базою.

## Структура файлів

* **create\_tables.sql**
  Скрипт для створення п’яти таблиць:

  1. `manufacturers` — виробники автомобілів
  2. `models`        — моделі
  3. `engines`       — специфікації двигунів
  4. `transmissions` — коробки передач
  5. `features`      — додаткові фічі й опції

* **insert\_data.sql**
  Скрипт для наповнення таблиць реалістичними рядками (по 5–10 записів кожна) з прикладами моделей і їх характеристик.

* **queries.sql**
  Приклади типових запитів:

  * Вибірка моделей за роком старту випуску
  * Об’єднання (JOIN) даних п’яти таблиць
  * Агрегація з використанням `GROUP BY`, `HAVING` та `ORDER BY`
  * Використання `UNION` і `LIMIT`

## Налаштування та запуск

1. **Встановіть MySQL** (або MariaDB) та переконайтеся, що сервер працює.
2. **Створіть порожню базу:**

   ```sql
   CREATE DATABASE hw1_idb;
   ```
3. **Імпортуйте схему:**

   ```bash
   mysql -u <user> -p hw1_idb < create_tables.sql
   ```
4. **Імпортуйте дані:**

   ```bash
   mysql -u <user> -p hw1_idb < insert_data.sql
   ```
5. **Перевірте роботу запитів:**

   ```bash
   mysql -u <user> -p hw1_idb < queries.sql
   ```

> Уважно слідкуйте за тим, щоб у вашого користувача були права на `CREATE`, `INSERT`, `REFERENCES` тощо.

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

## Розширення

* Ви можете додавати нові таблиці (наприклад, `sales`, `owners` тощо) і створювати між ними зовнішні ключі.
* Оновлюйте дані у `insert_data.sql` для додавання нових моделей.

