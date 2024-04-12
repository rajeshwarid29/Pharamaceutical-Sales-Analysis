use pharma;
show tables;

#1) Retrieve all columns for all records in the dataset.
select * from pharma_data;

#2) How many unique countries are represented in the dataset?
select distinct (country) 
from pharma_data;

#3) Select the names of all the customers on the 'Retail' channel
select * from pharma_data;
select customername, subchannel
from pharma_Data
where subchannel = 'Retail';

#4) Find the total quantity sold for the ' Antibiotics' product class
select * from pharma_Data;
select sum(quantity) as Total_quantity_sold
from pharma_Data
where productclass = 'antibiotics';

#5) List all the distinct months present in the dataset
select * from pharma_data;
select distinct (month) 
from pharma_data;

#6) Calculate the total sales for each year
select * from pharma_data;
select year, sum(sales) as total_Sales
from pharma_data
group by year;

#7) Find the customer with the highest sales value
select * from pharma_Data;
select customername, sales
from pharma_data
order by sales desc
limit 1;

#8) Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'.
select * from pharma_data;
select nameofsalesrep as Employees, Manager
from pharma_data
where manager = 'James goodwill';

#9) Retrieve the top 5 cities with the highest sales
select * from pharma_Data;
select city as top_5_cities, sum(sales) as total_sales
from pharma_data
group by top_5_cities
order by total_sales desc
limit 5;

#10) Calculate the average price of products in each sub-channel
select * from pharma_data;
select avg(price) as average_price, subchannel
from pharma_data
group by subchannel;

#11) Get the name of the Sales Rep and the corresponding sales records. 
select * from pharma_data;
select nameofsalesrep, sum(sales) as sales_record
from pharma_data
group by nameofsalesrep;

#12) Retrieve all sales made by employees from ' Rendsburg ' in the year 2018
select distributor, customername, city, productname, sales
from pharma_data
where city = 'rendsburg' and year = 2018;

#13) Calculate the total sales for each product class, for each month, and order the results by year, month, and product class.
select * from pharma_data;
select productclass, month, year, sum(sales) as Total_sales
from pharma_data
group by productclass, month, year
order by productclass, month, year;

#14) Find the top 3 sales reps with the highest sales in 2019.
select * from pharma_data;
select nameofsalesrep, year, sum(sales) as Highest_Sales
from pharma_data
where year = 2019
group by nameofsalesrep, year
order by Highest_sales desc
limit 3;

#15) Calculate the monthly total sales for each sub-channel, and then calculate the average
-- monthly sales for each sub-channel over the years
select * from pharma_Data;
select subchannel, month, sum(sales) as Total_Sales,
avg(sales) as Average_Sales, year
from pharma_data
group by subchannel, month,year
order by month, year;

#16) Create a summary report that includes the total sales, average price, and total quantity
-- sold for each product class
select * from pharma_data;
select productclass, sum(sales) as Total_sales,
avg(price) as Average_price,
sum(quantity) as Total_quantity_sold
from pharma_data
group by productclass;

#17) Find the top 5 customers with the highest sales for each year
select * from pharma_data;
with RankedCustomers as 
    (select customername, 
           year, 
           sales,
           rank() over (partition by year order by sales desc) as Top_5
    from pharma_data)
select customername, year, sales
from RankedCustomers
where Top_5 <= 5;


#18) Calculate the year-over-year growth in sales for each country.
select * from pharma_data;
select 
    country,
    year,
    sales as current_year_sales,
    (sales - lag(sales) over (partition by country order by year)) / 
    lag(sales) over (partition by country order by year) as sales_growth_rate
from 
    pharma_data;
    
#19) List the months with the lowest sales for each year
select month, year, min(Sales) as lowest_Sales
from pharma_data
group by month, year
order by month,year, lowest_sales;

#20) Calculate the total sales for each sub-channel in each country, and then find the country
-- with the highest total sales for each sub-channel.
select subchannel, country, sum(sales) as total_sales
from pharma_data
group by subchannel,country
order by total_sales desc;



