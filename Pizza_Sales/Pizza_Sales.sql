select * from pizza_sales;

select round(sum(total_price),2)
as Total_revenune from pizza_sales;

select round(sum(total_price) / count(Distinct order_id),0) as Avg_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizza_Sold from pizza_sales;

select count(Distinct order_id) as Total_Orders from pizza_sales;

select sum(quantity) / count(Distinct order_id) as Avg_Pizza_per_order from pizza_sales;

select DATENAME(DW, order_date) as order_day, count(Distinct order_id) as order_count from pizza_sales group by DATENAME(DW, order_date);

select DATEPART(hour, order_time) as order_hours, count(Distinct order_id) as order_count from pizza_sales group by DATEPART(hour, order_time) order by DATEPART(hour, order_time);

select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 /(select sum(total_price) from pizza_sales where MONTH(order_date) =1) as PCT from pizza_sales where MONTH(order_date) =1 group by pizza_category;

select pizza_size, round(sum(total_price),2) as Total_Sales, round(sum(total_price) *100/ (select sum(total_price) from pizza_sales where DATEPART(QUARTER,order_date)=1),2) as PCT from pizza_sales where DATEPART(QUARTER,order_date)=1 group by pizza_size order by PCT DESC;

select pizza_category, sum(quantity) as Total_Pizza_Sold from pizza_sales group by pizza_category order by Total_Pizza_Sold desc;

select TOP 5 pizza_name, sum(quantity) as Total_Pizza_Sold from pizza_sales group by pizza_name order by Total_Pizza_Sold desc;