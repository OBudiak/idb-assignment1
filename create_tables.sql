use hw1_idb;
DROP TABLE IF EXISTS features, transmissions, engines, models, manufacturers;

CREATE TABLE IF NOT EXISTS manufacturers (
  manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS models (
  model_id INT AUTO_INCREMENT PRIMARY KEY,
  manufacturer_id INT NOT NULL,
  model_name VARCHAR(100) NOT NULL,
  year_start YEAR,
  year_end YEAR
);

CREATE TABLE IF NOT EXISTS engines (
  engine_id INT AUTO_INCREMENT PRIMARY KEY,
  model_id INT NOT NULL,
  engine_type VARCHAR(50),
  displacement_cc INT,
  horsepower INT
);

CREATE TABLE IF NOT EXISTS transmissions (
  transmission_id INT AUTO_INCREMENT PRIMARY KEY,
  model_id INT NOT NULL,
  type VARCHAR(50),
  gears INT
);

CREATE TABLE IF NOT EXISTS features (
  feature_id INT AUTO_INCREMENT PRIMARY KEY,
  model_id INT NOT NULL,
  feature VARCHAR(100) NOT NULL
);
