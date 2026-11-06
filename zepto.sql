drop table if exists zepto;

create table zepto(
sku_id serial primary key,
category varchar(100),
name varchar(100) not null,
mrp numeric(8,2),
discountPercent numeric(8,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer

);

--data exploration
--count of rows
select count(*) from zepto;
--sample data
select * from zepto
limit 10;

--null values
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

--different product categories
select distinct category
from zepto
order by category;

--product instock vs out of stock
select distinct name
from zepto
where outOfStock=false;

--number of products,instock vs out of stock
select outOfStock,count(sku_id)
from zepto
group by outOfStock;

--product names present multiple times
select name,count(sku_id) as "No. of SKUs"
from zepto
group by name
having count(sku_id)>5
order by count(sku_id) desc;

--data cleaning..........
--products where price=0

select * from zepto
where mrp=0 or discountedSellingPrice=0;
--the price should not be 0 so delete that row from dataset
delete from zepto
where mrp=0;

--convertpaise to rs/
update zepto
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;


--BUSINESS INSIGHT QUERIES
--Q1.Find the top 10 best value products based on the discount percentage

select distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;

--Q2.What are the products with high MRP but out of stock

select distinct name,mrp
from zepto
where outOfStock=true and mrp>300
order by mrp desc;

--Q3.calculate estimated revenue for each category
select category,
sum(discountedSellingPrice*availableQuantity) as revenue
from zepto
group by category
order by revenue desc;

--Q4.Find all products where mrp is greater than rs.500 and discount is less than 10%
select name,mrp,discountPercent
from zepto
where mrp>500 and discountPercent<10
order by mrp desc,discountPercent desc
;

--Q5.Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discountPercent),2) as avgDiscPercen
from zepto
group by category
order by avgDiscPercen desc
limit 5;

--Q6.Find the price per gram for products above 100g and sort by best value.
select name,weightInGms,discountedSellingPrice,
round((mrp/weightInGms),2) as gramPrice
from zepto
where weightInGms>=100
order by gramPrice asc
;
--Q7.Group the products into categories like low,medium,bulk(based on their weight in grams)
select distinct name,weightInGms,
case when weightInGms < 1000 then 'Low'
when weightInGms < 5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto;

--Q8. What's the total inventory weight per category
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;








