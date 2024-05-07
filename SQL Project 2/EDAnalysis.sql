-- EXPLORATORY DATA ANALYSIS

-- Checking for duplicates
SELECT id, salary, age
FROM responses_v2
WHERE salary IN (
	SELECT salary
	FROM responses_v2
	GROUP BY salary
	HAVING COUNT(*) > 1
)
ORDER BY salary;

-- Number of respondents
SELECT COUNT(id)
FROM responses_v2;
-- 9898 respondents

-- Comparing age and salary, grouped by preferred computer
SELECT computer_brandname,
		MIN(age),
		MAX(age),
        MIN(salary),
        MAX(salary)
FROM responses_v2
GROUP BY computer_brandname;

-- Age bracket
SELECT age_bracket, COUNT(age_bracket) as total_count
FROM responses_v2
GROUP BY age_bracket
ORDER BY total_count DESC;
-- Most of the respondents are from the Old age bracket

-- Education level
SELECT education_level, COUNT(education_level) as total_count
FROM responses_v2
GROUP BY education_level
ORDER BY total_count DESC;
-- Those who didn't finish HS top the list but majority of the respondents finished HS, college and post graduate studies

-- Most preferred computer brand
SELECT COUNT(computer_brandname)
FROM responses_v2
WHERE computer_brandname = 'Acer';
-- 3744

SELECT COUNT(computer_brandname)
FROM responses_v2
WHERE computer_brandname = 'Sony';
-- 6154

-- Percentage of respondents who prefer Sony
SELECT 
    (COUNT(CASE WHEN computer_brandname = 'Sony' THEN 1 END)
    / COUNT(id) * 100) AS percentage_sony
FROM responses_v2;

-- DEMOGRAPHICS OF SONY LOVERS

-- Grouping respondents by age bracket
SELECT age_bracket, COUNT(age_bracket) AS count_bracket
FROM responses_v2
WHERE computer_brandname = 'Sony'
GROUP BY age_bracket
ORDER BY count_bracket DESC;
-- More than half who like Sony are from the Old Age bracket

-- Grouping respondents by their car brand name
SELECT car_brandname, COUNT(car_brandname) AS count_car
FROM responses_v2
WHERE computer_brandname = 'Sony'
GROUP BY car_brandname
ORDER BY count_car DESC;
-- Respondents who drives Subaru top the list

-- Education level
SELECT education_level, COUNT(education_level) AS count_ed
FROM responses_v2
WHERE computer_brandname = 'Sony'
GROUP BY education_level
ORDER BY count_ed DESC;
-- Almost equal numbers for each education level

-- Region
SELECT US_region, COUNT(US_region) AS count_region
FROM responses_v2
WHERE computer_brandname = 'Sony'
GROUP BY US_region
ORDER BY count_region DESC;
-- Sony lovers from the Pacific region top the list with 740

-- Salary bracket
SELECT salary_bracket, COUNT(salary_bracket) AS count_salary
FROM responses_v2
WHERE computer_brandname = 'Sony'
GROUP BY salary_bracket
ORDER BY count_salary DESC;
-- More than half are high earners and followed by below minimum earners

-- DEMOGRAPHICS OF ACER LOVERS
-- Age
SELECT age_bracket, COUNT(age_bracket) AS count_age
FROM responses_v2
WHERE computer_brandname = 'Acer'
GROUP BY age_bracket
ORDER BY count_age DESC;
-- Most respondents are from the old age bracket

-- Car brand
SELECT car_brandname, COUNT(car_brandname) AS count_car
FROM responses_v2
WHERE computer_brandname = 'Acer'
GROUP BY car_brandname
ORDER BY count_car DESC;
-- Most of the respondents drive Mitsubishi then followed by Cadillac

-- Salary
SELECT salary_bracket, COUNT(salary_bracket) AS count_salary
FROM responses_v2
WHERE computer_brandname = 'Acer'
GROUP BY salary_bracket
ORDER BY count_salary DESC;
-- Below minimun earners top the list



