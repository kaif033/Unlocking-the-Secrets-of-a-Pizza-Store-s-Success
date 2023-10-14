create schema sales;
use sales;
desc   pizza;
select count(*) from pizza;
select * from pizza;

-- total Revenue:
select round(sum(total_price),2) as total_revenue from pizza  ;


-- Average order value:
 select round(sum(total_price)/count(distinct order_id),2) as Avg_order_value from pizza;

-- total pizza sold:
select sum(quantity) as Pizza_sold from pizza;

-- total orders:
select count(distinct order_id)  as Total_orders from pizza ;

-- Average pizza per Order:
select round(sum(quantity) /count(distinct order_id),2) avg_pizza_per_order from pizza;

-- daily trend for total orders :
select * from pizza;
SET GLOBAL sql_mode = " ";

ALTER TABLE pizza
MODIFY COLUMN order_date date;


-- sales by pizza categorya nd percent sales :
select pizza_category,sum(total_price) as Sales 
from pizza group by pizza_category;  

select pizza_category,sum(total_price) as Sales,
concat(round(sum(total_price)*100 /(select sum(total_price)  from pizza),2),"%") 
as percent_pizza_sold from pizza
group by pizza_category;
  -- or  -- 
SELECT 
    pizza_category,
    SUM(total_price) as total_sales,
    (SUM(total_price) / (SELECT SUM(total_price) FROM pizza)) * 100 as percentage_of_total
FROM
    pizza
GROUP BY
    pizza_category;

-- percent of sales via pizza size--
select * from pizza;
select pizza_size,sum(total_price) as Sales,
concat(round(sum(total_price)*100 /(select sum(total_price)  from pizza),2),"%") 
as percent_pizza_sold from pizza
group by pizza_size;


-- top 5 best sellers by revenue , total quantity and total orders

select pizza_name,sum(total_price) as Revenue from pizza
group by pizza_name
order by Revenue desc
 limit 5;
 
 select pizza_name,sum(quantity) as QT from pizza
group by pizza_name
order by QT  desc
 limit 5;
 
  select pizza_name,count( distinct order_id) as Total_orders from pizza
group by pizza_name
order by Total_orders  desc
 limit 5;
 
 --  bottom 5 sellers by revenue , total quantity and total orders:
 select pizza_name,sum(total_price) as Revenue from pizza
group by pizza_name
order by Revenue 
 limit 5;
 
 
 select pizza_name,sum(quantity) as QT from pizza
group by pizza_name
order by QT  
 limit 5;
 
select pizza_name,count( distinct order_id) as Total_orders from pizza
group by pizza_name
order by Total_orders  limit 5;

select pizza_name , sum(total_price) from pizza group by pizza_name order by sum(total_price);