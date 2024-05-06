-- DATA CLEANING

SELECT * FROM safe_chemicals.fragrances;


-- Removing brackets in the List Call column
UPDATE fragrances
SET `List Call` = 
	SUBSTRING_INDEX(`List Call`, '[', 1);


-- Removing asterisk in the Caveat - Chemical Use column
UPDATE fragrances
SET `Caveat - Chemical Use` = (
	SELECT SUBSTRING_INDEX(`Caveat - Chemical Use`, '*', -1)
	);


-- Replacing 'see above/See above' with 'see notes below/See notes below'
UPDATE fragrances
SET `Caveat - Chemical Use` = 
	REPLACE(`Caveat - Chemical Use`, 'see above', 'see notes below')
	WHERE `Caveat - Chemical Use` LIKE '%see above%';

UPDATE fragrances
SET `Caveat - Chemical Use` = 
	REPLACE(`Caveat - Chemical Use`, 'See above', 'See notes below')
	WHERE `Caveat - Chemical Use` LIKE '%See above%';
    



