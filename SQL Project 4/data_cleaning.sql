-- DATA CLEANING

-- Cloning the raw table for data cleaning

CREATE TABLE layoffs_cleaned
LIKE layoffs;

INSERT layoffs_cleaned
SELECT *
FROM layoffs;


-- Checking for duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_cleaned;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_cleaned
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


-- Removing duplicates

CREATE TABLE `layoffs_cleaned2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_cleaned2;

INSERT INTO layoffs_cleaned2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_cleaned;

SELECT *
FROM layoffs_cleaned2
WHERE row_num > 1;

DELETE
FROM layoffs_cleaned2
WHERE row_num > 1;


-- Standardizing data

SELECT DISTINCT(industry)
FROM layoffs_cleaned2
ORDER BY 1;
-- Crypto is not standardized

UPDATE layoffs_cleaned2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT(country)
FROM layoffs_cleaned2;
-- United States is not standardized

SELECT *
FROM layoffs_cleaned2
WHERE country LIKE 'United States.%';
-- 4 entries

UPDATE layoffs_cleaned2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`
FROM layoffs_cleaned2;
-- Incorrect datatype and format of date

SELECT *
FROM layoffs_cleaned2
WHERE `date` = 'NULL';
-- 1 entry

-- Convert 'NULL' to null in order alter the datatype of `date` column from string to date
UPDATE layoffs_cleaned2
SET `date` = NULL
WHERE `date` = 'NULL';

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_cleaned2;

UPDATE layoffs_cleaned2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_cleaned2
MODIFY COLUMN `date` DATE;


-- Handling blank values

SELECT *
FROM layoffs_cleaned2
WHERE industry = '';
-- 3 companies with blank values in the industry column

UPDATE layoffs_cleaned2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_cleaned2 lc1
JOIN layoffs_cleaned2 lc2
	ON lc1.company = lc2.company
    AND lc1.location = lc2.location
WHERE lc1.industry IS NULL
AND lc2.industry IS NOT NULL;
    
UPDATE layoffs_cleaned2 lc1
JOIN layoffs_cleaned2 lc2
	ON lc1.company = lc2.company
SET lc1.industry = lc2.industry
WHERE lc1.industry IS NULL
AND lc2.industry IS NOT NULL;


-- Changing 'NULL' to null values and changing the datatype from text to INT

UPDATE layoffs_cleaned2
SET total_laid_off = NULL
WHERE total_laid_off = 'NULL';

UPDATE layoffs_cleaned2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'NULL';

UPDATE layoffs_cleaned2
SET stage = NULL
WHERE stage = 'NULL';

UPDATE layoffs_cleaned2
SET funds_raised_millions = NULL
WHERE funds_raised_millions = 'NULL';

ALTER TABLE layoffs_cleaned2
MODIFY COLUMN total_laid_off INT;

ALTER TABLE layoffs_cleaned2
MODIFY COLUMN percentage_laid_off INT;

ALTER TABLE layoffs_cleaned2
MODIFY COLUMN funds_raised_millions INT;

-- Removing row_num column

ALTER TABLE layoffs_cleaned2
DROP COLUMN row_num;




