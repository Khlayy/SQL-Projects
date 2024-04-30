SELECT * FROM studio_ghibli.ghibli;

-- Clone ghibli table as cleaned_ghibli
CREATE TABLE cleaned_ghibli AS
SELECT * 
FROM ghibli;

-- Exploring the data
SELECT * 
FROM cleaned_ghibli;

-- Number of rows present in the dataset
SELECT COUNT(*)
FROM cleaned_ghibli;

-- Finding duplicates in Name column
SELECT DISTINCT (Name), COUNT(Name)
FROM cleaned_ghibli
GROUP BY name;

-- Removing the year enclosed in parenthesis in Name column
UPDATE cleaned_ghibli
SET Name = (
	SELECT SUBSTRING_INDEX(Name, '(', 1)
	);

-- Standardization of Screenplay column: Removing middle initial
UPDATE cleaned_ghibli
SET Screenplay = 'Joan Robinson'
	WHERE Screenplay = 'Joan G. Robinson';

-- Standardization of Screenplay column: Removing middle initial    
UPDATE cleaned_ghibli
SET Screenplay = 'Ursula Le Guin'
	WHERE Screenplay = 'Ursula K. Le Guin';

-- Removing the currency and decimal in Budget column
UPDATE cleaned_ghibli
SET Budget =
	 REPLACE(REPLACE(Budget, '$', ''), '.', '');

-- Removing the currency and decimal in Revenue column
UPDATE cleaned_ghibli
SET Revenue = 
	REPLACE(REPLACE(Revenue, '$', ''), '.', '');
    
-- Changing the datatype of Budget column from TEXT to BIGINT
ALTER TABLE cleaned_ghibli
MODIFY Budget BIGINT;

-- Changing the datatype of Budget column from TEXT to BIGINT
ALTER TABLE cleaned_ghibli
MODIFY Revenue BIGINT;

-- Adding Animation_Genre column to separate genres
ALTER TABLE cleaned_ghibli
ADD Animation_Genre VARCHAR(30);

-- Separate animation genres
UPDATE cleaned_ghibli
SET Animation_Genre = 
	CASE 
		WHEN`Genre 1` = 'Animation' THEN 'Animation'
		WHEN`Genre 2` = 'Animation' THEN 'Animation'
		WHEN`Genre 3` = 'Animation' THEN 'Animation'
        ELSE 'n/a'
	END;
    
-- Adding Fantasy_Genre column to separate fanatsy genres
ALTER TABLE cleaned_ghibli
ADD Fantasy_Genre VARCHAR(30);

-- Separate fantasy genres
UPDATE cleaned_ghibli
SET Fantasy_Genre =
	CASE
		WHEN `Genre 1` = 'Fantasy' THEN 'Fantasy'
		WHEN `Genre 2` = 'Fantasy' THEN 'Fantasy'
		WHEN `Genre 3` = 'Fantasy' THEN 'Fantasy'
        ELSE 'n/a'
	END;

-- Adding Drama_Genre column to separate drama genres
ALTER TABLE cleaned_ghibli
ADD Drama_Genre VARCHAR(30);

-- Separate drama genres
UPDATE cleaned_ghibli
SET Drama_Genre =
	CASE
		WHEN `Genre 1` = 'Drama' THEN 'Drama'
		WHEN `Genre 2` = 'Drama' THEN 'Drama'
		WHEN `Genre 3` = 'Drama' THEN 'Drama'
        ELSE 'n/a'
	END;

-- Adding Family_Genre column to separate family genres
ALTER TABLE cleaned_ghibli
ADD Family_Genre VARCHAR(30);

-- Separate drama genres
UPDATE cleaned_ghibli
SET Family_Genre =
	CASE
		WHEN `Genre 1` = 'Family' THEN 'Family'
		WHEN `Genre 2` = 'Family' THEN 'Family'
		WHEN `Genre 3` = 'Family' THEN 'Family'
        ELSE 'n/a'
	END;
    
 -- Adding Adventure_Genre column to separate adventure genres
ALTER TABLE cleaned_ghibli
ADD Adventure_Genre VARCHAR(30);

-- Separate adventure genres
UPDATE cleaned_ghibli
SET Adventure_Genre =
	CASE
		WHEN `Genre 1` = 'Adventure' THEN 'Adventure'
		WHEN `Genre 2` = 'Adventure' THEN 'Adventure'
		WHEN `Genre 3` = 'Adventure' THEN 'Adventure'
        ELSE 'n/a'
	END;   

 -- Adding Romance_Genre column to separate romance genres
ALTER TABLE cleaned_ghibli
ADD Romance_Genre VARCHAR(30);

-- Separate romance genres
UPDATE cleaned_ghibli
SET Romance_Genre =
	CASE
		WHEN `Genre 1` = 'Romance' THEN 'Romance'
		WHEN `Genre 2` = 'Romance' THEN 'Romance'
		WHEN `Genre 3` = 'Romance' THEN 'Romance'
        ELSE 'n/a'
	END;   

-- Adding Comedy_Genre column to separate comedy genres
ALTER TABLE cleaned_ghibli
ADD Comedy_Genre VARCHAR(30);

-- Separate comedy genres
UPDATE cleaned_ghibli
SET Comedy_Genre =
	CASE
		WHEN `Genre 1` = 'Comedy' THEN 'Comedy'
		WHEN `Genre 2` = 'Comedy' THEN 'Comedy'
		WHEN `Genre 3` = 'Comedy' THEN 'Comedy'
        ELSE 'n/a'
	END;   

-- Adding War_Genre column to separate war genres
ALTER TABLE cleaned_ghibli
ADD War_Genre VARCHAR(30);

-- Separate comedy genres
UPDATE cleaned_ghibli
SET War_Genre =
	CASE
		WHEN `Genre 1` = 'War' THEN 'War'
		WHEN `Genre 2` = 'War' THEN 'War'
		WHEN `Genre 3` = 'War' THEN 'War'
        ELSE 'n/a'
	END;   

SELECT *
FROM cleaned_ghibli;
