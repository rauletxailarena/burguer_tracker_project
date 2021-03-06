DROP TABLE IF EXISTS burger_deals CASCADE;
DROP TABLE IF EXISTS burgers CASCADE;
DROP TABLE IF EXISTS deals CASCADE;
DROP TABLE IF EXISTS eateries CASCADE;

CREATE TABLE eateries(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  logo_url VARCHAR(255)
);

CREATE TABLE deals(
  id SERIAL PRIMARY KEY,
  eatery_id INT REFERENCES eateries(id) ON DELETE CASCADE,
  name VARCHAR(255) UNIQUE,
  day_of_the_week VARCHAR(255),
  pct_off INT
);

CREATE TABLE burgers(
  id SERIAL PRIMARY KEY,
  eatery_id INT REFERENCES eateries(id) ON DELETE CASCADE,
  name VARCHAR(255) UNIQUE,
  price REAL
);

CREATE TABLE burger_deals(
  id SERIAL PRIMARY KEY,
  burger_id INT REFERENCES burgers(id) ON DELETE CASCADE,
  deal_id INT REFERENCES deals(id) ON DELETE CASCADE,
  unique (burger_id, deal_id)
);
