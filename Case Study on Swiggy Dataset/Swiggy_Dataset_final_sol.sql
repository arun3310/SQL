use bootcamp;

select o.*, r.r_name, od.f_id, f.f_name, u.name
from orders o
join restaurants r
on r.r_id = o.r_id
join order_details od
on od.order_id = o.order_id
join food f
on f.f_id = od.f_id
right join users u
on u.user_id = o.user_id;


-- Q1. Find the customers who have never ordered.

select name from users
where user_id not in (select user_id from orders);



-- Q2. Which restaurant has got the most number of orders?

select r_name, count(r_name) as Restaurant_Count
from swiggy_complete_data
where r_name is not null
group by r_name
order by Restaurant_Count desc;

-- KFC Restaurant has got the most number of orders.


-- Q3. Average Price/food.

select f.f_name, avg(price) as 'Avg Price'
from menu m
join food f
on m.f_id = f.f_id
group by m.f_id, f.f_name;


-- Q4. Which restaurant has done the most amount of orders?

select r_name, amount
from swiggy_complete_data
where r_name is not null
group by r_name, amount
order by amount desc;


-- Q5. Which food item has been ordered the most across all restaurants?

select f_name, count(*) as Total
from swiggy_complete_data
where f_name is not null
group by f_name
order by Total desc;

-- Q6. Find the food item under each restaurant whose amount is the highest.

select r_name, f_name, amount,
first_value(f_name) over(partition by r_name order by amount desc) as Food_Item_Amount
from swiggy_complete_data;


