CREATE TABLE cars(
brand VARCHAR(255),
model VARCHAR(255),
year INT 
);

INSERT INTO cars(brand, model, year)
values
	('Ford', 'Mustang', 1964),
	('Volvo', 'p1800', 1968),
	('BMW', 'M1', 1978),
	('Toyota', 'Celica', 1975);

SELECT * from cars;

SELECT brand, year from cars;

ALTER TABLE cars
ADD color VARCHAR(255);

UPDATE cars
SET color = 'red'
WHERE brand = 'Volvo';

ALTER TABLE cars
ALTER COLUMN year TYPE VARCHAR(4);

ALTER TABLE cars
DROP COLUMN color;

CREATE TABLE NYSE_nyse(
Ticker_symbol VARCHAR(50),
Security
);



