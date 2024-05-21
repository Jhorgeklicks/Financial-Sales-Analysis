use salesdata;

-- Querying Unque Count of Countries
select Count(DISTINCT(Country)) as `Number Of Countries` from salesdata;

-- 1. querying total and Averahe sales by Market
SELECT Market, SUM(Sales) as "Total Sales", AVG(Sales) AS "Average Sales" from salesdata group by Market;

-- 2. querying Total profit
select SUM(Profit) as "Total Profit" from salesdata;

-- 3. Count of Orders By Country
SELECT Country, COUNT(*) AS Total_Orders
FROM salesdata
GROUP BY Country 
ORDER BY Total_Orders DESC;

-- 4. Count of Orders By Segment
SELECT Segment, COUNT(*) AS Total_Orders
FROM salesdata
GROUP BY Segment
ORDER BY Total_Orders DESC;

-- 5. findING all orders placed by customers whose names contain "toby"
SELECT `Customer Name`,`Order Date`, `Ship Mode` , Country, Quantity
FROM salesdata
WHERE `Customer ID` IN (
  SELECT `Customer ID`
  FROM salesdata
  WHERE `Customer Name` LIKE '%Toby%'
);

 -- 6. Total Orders by Segment:
SELECT `Product Name`, 
	SUM(Sales) as "Total Sales" 
    FROM salesdata GROUP BY `Product Name` 
    ORDER BY "Total Sales" 
    ASC LIMIT 10;
    
-- 7. Query all products where the Order priority is High
SELECT `Product Name`,`Order Priority`, Quantity , Profit 
FROM salesdata WHERE `Order Priority` = "High";

-- 8. Top 5 Customers by Order Value:
SELECT `Customer Name`, SUM(Sales) AS Total_Order_Value
FROM salesdata
GROUP BY `Customer Name`
ORDER BY Total_Order_Value DESC
LIMIT 5;
select * from salesdata;

-- 9. Orders for Customer 'Toby Braunhardt':
SELECT *
FROM salesdata
WHERE `Customer Name` = 'Toby Braunhardt';

-- 10.  Case Statement for Segment:
SELECT Segment,
CASE
WHEN Segment = 'Consumer' THEN 'Individual'
WHEN Segment = 'Home Office' THEN 'Business'
ELSE 'Other'
END AS Segment_Type
FROM salesdata
GROUP BY Segment;


-- 11. Querying All Orders between 10/10/20111 and 1/3/2011
SELECT *
FROM salesdata
WHERE `Order Date` BETWEEN '1/3/2011' AND '10/10/2011';

--
SELECT salesdata.`Customer ID`, salesdata.`Customer Name`, COALESCE(sales.State, 'Unknown') AS CustomerState
FROM salesdata
LEFT JOIN salesdata as sales ON sales.`Customer ID` = salesdata.`Customer ID` LIMIT 20 ;




