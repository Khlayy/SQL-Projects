-- CREATED zara database
-- Imported the csv dataset and named it as zara_sales


SELECT TOP (1000) [Product_ID]
      ,[Product_Position]
      ,[Promotion]
      ,[Product_Category]
      ,[Seasonal]
      ,[Sales_Volume]
      ,[brand]
      ,[url]
      ,[sku]
      ,[name]
      ,[description]
      ,[price]
      ,[currency]
      ,[scraped_at]
      ,[terms]
      ,[section]
  FROM [zara].[dbo].[zara_sales]

  --View and check the dataset
  SELECT *
  FROM zara_sales

  --Check for duplicates
  SELECT Product_ID, COUNT(Product_ID) AS ID_duplicate
  FROM zara_sales
  GROUP BY Product_ID

  --PERFORMING AGGREGATE FUNCTIONS
      
  --Total Sales Volume
  SELECT SUM(Sales_Volume) AS Total_Sales_Volume
  FROM zara_sales

  --Total Revenue
  SELECT SUM(Sales_Volume * price) AS Revenue
  FROM zara_sales
 
 --Total Sales Volume of Regular Items
  SELECT Sum(Sales_Volume) AS Total_Sales_Volume_Regular
  FROM zara_sales
  WHERE Promotion = '0'
  
  --Total Sales Volume of Discounted Items
  SELECT Sum(Sales_Volume) AS Total_Sales_Volume_Discounted
  FROM zara_sales
  WHERE Promotion = '1'
  
  --Total Revenue of Regular Items
  SELECT Sum(Sales_Volume * price) AS Total_Revenue_Regular
  FROM zara_sales
  WHERE Promotion = '0'

 --Total Revenue of Discounted Items
  SELECT Sum(Sales_Volume * price) AS Total_Revenue_Discounted
  FROM zara_sales
  WHERE Promotion = '1'

  --Revenue by Gender
  SELECT Section, Sum(Sales_Volume * price) as Revenue_Gender
  FROM zara_sales
  GROUP BY Section
  ORDER BY Revenue_Gender Asc

  --Sales Volume by Gender
  SELECT Section, Sum(Sales_Volume * price) as Sales_Gender
  FROM zara_sales
  GROUP BY Section
  ORDER BY Sales_Gender Asc

  --Type of clothing that generated the highest revenue
  SELECT COUNT(terms), terms, sum(Sales_Volume * price) AS revenue
  FROM zara_sales
  GROUP BY terms
  ORDER BY revenue DESC
 
 --Highest Sales Volume (Man and Woman Section) not on sale
 SELECT Promotion, Seasonal, Sales_Volume, name, section
 FROM zara_sales
 WHERE Promotion = '0'
 ORDER BY Sales_Volume DESC

 --Highest Sales Volume (Man and Woman Section) on sale
 SELECT Seasonal, Sales_Volume, name
 FROM zara_sales
 WHERE Promotion = '1' AND section = 'MAN'
 ORDER BY Sales_Volume DESC

 --Total Revenue for regular items (Men's section)
 SELECT SUM(Sales_Volume * price) AS totalrev_regular_male
 FROM zara_sales
 WHERE Promotion = '0' AND section = 'MAN'

 --Total Revenue for regular items (Women's section)
 SELECT SUM(Sales_Volume * price) AS totalrev_regular_woman
 FROM zara_sales
 WHERE Promotion = '0' AND section = 'WOMAN'

 --Total Revenue for Discounted items (Men's section)
 SELECT SUM(Sales_Volume * price) AS totalrev_disc_male
 FROM zara_sales
 WHERE Promotion = '1' AND section = 'MAN'

 --Total Revenue for Discounted items (Women's section)
 SELECT SUM(Sales_Volume * price) AS totalrev_disc_woman
 FROM zara_sales
 WHERE Promotion = '1' AND section = 'WOMAN'

 --Total Sales Volume for Regular items (Men's section)
 SELECT SUM(Sales_Volume) AS totalsalesvol_man
 FROM zara_sales
 WHERE Promotion = '0' AND section = 'MAN'

 --Total Sales Volume for Regular items (Women's section)
 SELECT SUM(Sales_Volume) AS totalsalesvol_woman
 FROM zara_sales
 WHERE Promotion = '0' AND section = 'WOMAN'

 --Total Sales Volume for Discounted items (Men's section)
 SELECT SUM(Sales_Volume) AS totalsalesvol_disc_man
 FROM zara_sales
 WHERE Promotion = '1' AND section = 'MAN'

 --Total Sales Volume for Discounted items (Women's section)
 SELECT SUM(Sales_Volume) AS totalsalesvol_disc_woman
 FROM zara_sales
 WHERE Promotion = '1' AND section = 'WOMAN'

  --Men's regular items: Lowest and highest sales volume, cheapest and expensive price
  SELECT MIN(Sales_Volume) AS lowest_mr, MAX(Sales_Volume) AS highest_mr, MIN(price) AS cheap_mr, MAX(price) AS expensive_mr
  FROM zara_sales
  WHERE Promotion = '0' AND section = 'MAN'

 --Women's regular items: Lowest and highest sales volume, cheapest and expensive price
  SELECT MIN(Sales_Volume) AS lowest_wr, MAX(Sales_Volume) AS highest_wr, MIN(price) AS cheap_wr, MAX(price) AS expensive_wr
  FROM zara_sales
  WHERE Promotion = '0' AND section = 'WOMAN'
 
