-- Creating a copy of the responses table
CREATE TABLE responses_v2
AS
SELECT *
FROM responses;

-- Checking for duplicates
SELECT salary, age
FROM responses_v2
WHERE salary IN (
	SELECT salary
	FROM responses_v2
	GROUP BY salary
	HAVING COUNT(*) > 1
)
ORDER BY salary;

-- Total number of rows
SELECT COUNT(*)
FROM responses_v2;

-- Create a column 'id' AS PRIMARY KEY
ALTER TABLE responses_v2
ADD id INT PRIMARY KEY AUTO_INCREMENT;

-- Create a salary_bracket column to group the respondents according to their salary
ALTER TABLE responses_v2
ADD salary_bracket VARCHAR(30);

-- Assigning values into the salary_bracket column where:
	-- salary below 64000 AS 'Below Minimum'
	-- salary between 64001 AND 70000 AS 'Minimum'
	-- salary above 70000 AS 'High'
    
UPDATE responses_v2
SET salary_bracket = 'Below Minimum'
WHERE salary < 64000;

UPDATE responses_v2
SET salary_bracket = 'Minimum'
WHERE salary BETWEEN 64001 AND 80000;

UPDATE responses_v2
SET salary_bracket = 'Middle'
WHERE salary BETWEEN 80001 AND 100000;

UPDATE responses_v2
SET salary_bracket = 'High'
WHERE salary > 100001;

-- Create an age_bracket column to group the respondents according to their age
ALTER TABLE responses_v2
ADD age_bracket VARCHAR(30);

-- Assigning values into the age_bracket column where:
	-- age between 20 and 29 is 'Young Adult'
        -- age between 30 and 45 is 'Middle Age'
        -- age above 45 is 'Old Age'
        
UPDATE responses_v2
SET age_bracket = 'Young Adult'
WHERE age BETWEEN 20 AND 29;

UPDATE responses_v2
SET age_bracket = 'Middle Age'
WHERE age BETWEEN 30 AND 45;

UPDATE responses_v2
SET age_bracket = 'Old Age'
WHERE age > 45;

-- Creating a new column named education_level
ALTER TABLE responses_v2
ADD education_level VARCHAR(50);

-- Providing context by assigning values to education_level column where:
			-- 0 AS 'Less than High School'
			-- 1 AS 'High School'
			-- 2 AS 'Less than College'
			-- 3 AS 'College'
			-- 4 AS 'Postgraduate'

UPDATE responses_v2
SET education_level = 'Less than High School'
WHERE education = 0;

UPDATE responses_v2
SET education_level = 'High School'
WHERE education = 1;

UPDATE responses_v2
SET education_level = 'Less than College'
WHERE education = 2;

UPDATE responses_v2
SET education_level = 'College'
WHERE education = 3;

UPDATE responses_v2
SET education_level = 'Postgraduate'
WHERE education = 4;

-- Adding a new column named car_brandname
ALTER TABLE responses_v2
ADD car_brandname VARCHAR(50);

-- Providing context by assigning values to car_brandname column where:
		-- 1	BMW		11	Kia	
		-- 2	Buick		12	Lincoln	
		-- 3	Cadillac	13	Mazda
		-- 4	Chevrolet	14	Mercedes Benz
		-- 5	Chrysler	15	Mitsubishi	
		-- 6	Dodge		16	Nissan	
		-- 7	Ford		17	Ram
		-- 8	Honda		18	Subaru	
		-- 9	Hyundai		19	Toyota	
		-- 10	Jeep		20	Others
        
UPDATE responses_v2
SET car_brandname = 'BMW'
WHERE car_brand = 1;

UPDATE responses_v2
SET car_brandname = 'Buick'
WHERE car_brand = 2;

UPDATE responses_v2
SET car_brandname = 'Cadillac'
WHERE car_brand = 3;

UPDATE responses_v2
SET car_brandname = 'Chevrolet'
WHERE car_brand = 4;

UPDATE responses_v2
SET car_brandname = 'Chrysler'
WHERE car_brand = 5;

UPDATE responses_v2
SET car_brandname = 'Dodge'
WHERE car_brand = 6;

UPDATE responses_v2
SET car_brandname = 'Ford'
WHERE car_brand = 7;

UPDATE responses_v2
SET car_brandname = 'Honda'
WHERE car_brand = 8;

UPDATE responses_v2
SET car_brandname = 'Hyundai'
WHERE car_brand = 9;

UPDATE responses_v2
SET car_brandname = 'Jeep'
WHERE car_brand = 10;

UPDATE responses_v2
SET car_brandname = 'Kia'
WHERE car_brand = 11;

UPDATE responses_v2
SET car_brandname = 'Lincoln'
WHERE car_brand = 12;

UPDATE responses_v2
SET car_brandname = 'Mazda'
WHERE car_brand = 13;

UPDATE responses_v2
SET car_brandname = 'Mercedes Benz'
WHERE car_brand = 14;

UPDATE responses_v2
SET car_brandname = 'Mitsubishi'
WHERE car_brand = 15;

UPDATE responses_v2
SET car_brandname = 'Nissan'
WHERE car_brand = 16;

UPDATE responses_v2
SET car_brandname = 'Ram'
WHERE car_brand = 17;

UPDATE responses_v2
SET car_brandname = 'Subaru'
WHERE car_brand = 18;

UPDATE responses_v2
SET car_brandname = 'Toyota'
WHERE car_brand = 19;

UPDATE responses_v2
SET car_brandname = 'Others'
WHERE car_brand = 20;

-- Creating a new column named US_region and assigning values corresponding to region column whereas:
			-- 0	New England			5	East South Central
			-- 1	Mid-Atlantic			6	West South Central
			-- 2	East North Central		7	Mountain
			-- 3	West North Central		8	Pacific	
			-- 4	South Atlantic	

ALTER TABLE responses_v2
ADD US_region VARCHAR(50);

UPDATE responses_v2
SET US_region = 'New England'
WHERE region = 0;
				
UPDATE responses_v2
SET US_region = 'Mid-Atlantic'
WHERE region = 1;				
			
UPDATE responses_v2
SET US_region = 'East North Central'
WHERE region = 2;

UPDATE responses_v2
SET US_region = 'West North Central'
WHERE region = 3;

UPDATE responses_v2
SET US_region = 'South Atlantic'
WHERE region = 4;

UPDATE responses_v2
SET US_region = 'East South Central'
WHERE region = 5;

UPDATE responses_v2
SET US_region = 'West South Central'
WHERE region = 6;

UPDATE responses_v2
SET US_region = 'Mountain'
WHERE region = 7;

UPDATE responses_v2
SET US_region = 'Pacific'
WHERE region = 8;

-- Create a new column computer_brandname
ALTER TABLE responses_v2
ADD computer_brandname VARCHAR(20) NULL;

-- Assigning values to computer_brandname column by assigning values corresponding to computer_brand data where
    -- 0 AS 'Acer'
    -- 1 AS 'Sony'

-- 0 AS 'Acer'
UPDATE responses_v2
SET computer_brandname = 'Acer'
WHERE computer_brand = 0;

-- 1 AS 'Sony'
UPDATE responses_v2
SET computer_brandname = 'Sony'
WHERE computer_brand = 1;

SELECT *
FROM responses_v2;

-- Reordering columns for more organized viewing of data
ALTER TABLE responses_v2
MODIFY id INT AFTER salary;

ALTER TABLE responses_v2
MODIFY salary BIGINT AFTER id;

ALTER TABLE responses_v2
MODIFY salary_bracket VARCHAR(30) AFTER salary;

ALTER TABLE responses_v2
MODIFY age_bracket VARCHAR(30) AFTER age;

ALTER TABLE responses_v2
MODIFY education_level VARCHAR(50) AFTER education;

ALTER TABLE responses_v2
MODIFY car_brandname VARCHAR(50) AFTER car_brand;

ALTER TABLE responses_v2
MODIFY US_region VARCHAR(50) AFTER region;





