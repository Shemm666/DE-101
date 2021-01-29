select * from orders
left join people using(region)
left join returns using(order_id)
limit 10;

--топ 10 покупателей

select customer_name, sum(sales)::int as sales,
sum(profit)::int as profit,
round(sum(profit)/sum(sales)*100,2) as marginality_rate
from orders 
group by customer_name 
order by sales desc 
limit 10;

--sales on regions and categories;
create extension tablefunc;
/*select * from crosstab(
'select region, category, sum(sales) from orders
group by 1,2 order by 1') as ct (region varchar, Furniture numeric , "Office Supplies" numeric , Technology numeric);*/

select region, category, sum(sales) as sales from orders
group by 1,2;

