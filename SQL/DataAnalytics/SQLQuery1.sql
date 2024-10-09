--#Que. 1] Top 10 highest revenue generating products; products that are sold most based on sale_price & product_id
select top 10 product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc
-- each product's total sales by product id & top 10 

--#Que. 2] Top 5 highest selling products in each region
with cte as(	
select region, product_id, sum(sale_price) as sales 
from df_orders
group by region, product_id) 
select * from (
select *, 
	row_number() over (partition by region order by sales desc) as rn
from cte) A
where rn<5 