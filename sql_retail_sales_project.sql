project title - sql retail sales analysis

CREATE TABLE sales(
	transactions_id	INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(10),
	age	INT,
	category VARCHAR(20),	
	quantity INT,
	price_per_unit FLOAT,	
	cogs FLOAT,
	total_sale FLOAT

);

DROP TABLE sales;

SELECT * FROM sales;

-- import the retail sales csv file from pc

SELECT * FROM sales
LIMIT 10;


SELECT COUNT(*) 
FROM sales;


SELECT * FROM sales
WHERE transactions_id IS NULL;


SELECT * FROM sales
WHERE sale_date is NULL;

-- data cleaning 

SELECT * FROM sales
WHERE transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;


-- delete this null value rows

DELETE FROM sales
WHERE transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;


-- data explorations
-- how many sales we have

SELECT COUNT(*) total_sale FROM sales;

-- no. of customers

SELECT * FROM sales;

SELECT COUNT(DISTINCT customer_id) as total_sale FROM sales;


SELECT COUNT(DISTINCT category) as cate FROM sales;


-- data analysis and business key problem and answers

--1.
SELECT * FROM sales
WHERE sale_date = '2022-11-05';

SELECT COUNT(*) FROM sales
WHERE sale_date = '2022-11-05';

--2.

SELECT * FROM sales 
WHERE category = 'Clothing' AND TO_CHAR(sale_date,'YYYY-MM') = '2022-11' AND quantity > 2;


--3.

SELECT category, COUNT(total_sale) as sale, SUM(total_sale)
FROM sales
GROUP BY category
ORDER BY sale;


--4.

SELECT category, ROUND(AVG(age),2) 
FROM sales
WHERE category = 'Beauty'
GROUP BY category;


--5.

SELECT * FROM sales
WHERE total_sale > 1000;

--6.

SELECT category, gender, COUNT(*) as total_trans FROM sales
GROUP BY category,gender
ORDER BY 3;

--7.

SELECT 
EXTRACT(YEAR FROM sale_date) as year,
EXTRACT(MONTH FROM sale_date) as month,
SUM(total_sale) as total,
AVG(total_sale) as avg_sales
FROM sales
GROUP BY 1, 2
ORDER BY 1, 4 DESC;


--8.


SELECT * FROM sales;

SELECT customer_id, total_sale FROM sales ORDER BY 2 DESC LIMIT 5;



--9.

SELECT  customer_id , SUM(total_sale) as total_sales
FROM sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


--10.

SELECT
category, COUNT(DISTINCT customer_id) as unique_customer
FROM sales
GROUP BY 1;



