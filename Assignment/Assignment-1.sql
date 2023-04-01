USE DATABASE DEMO_DATABASE;

CREATE OR REPLACE TABLE SALES_DATA
(order_id VARCHAR(50),
 order_date varchar(50),
 ship_date varchar(50),
 ship_mode VARCHAR(15),
 customer_name VARCHAR(30),
 segment VARCHAR(15),
 state VARCHAR(50),
 country VARCHAR(50),
 market VARCHAR(50),
 region VARCHAR(50),
 product_id VARCHAR(50) NOT NULL PRIMARY KEY, // Primary key is set
 category VARCHAR(50),
 sub_category VARCHAR(50),
 product_name VARCHAR(150),
 sales number(10,0),
 quantity INT,
 discount FLOAT,
 profit FLOAT,
 shipping_cost FLOAT,
 order_priority VARCHAR(15),
 year INT
);
select * from SALES_DATA;
DESCRIBE TABLE SALES_DATA; // TO CHECK ORDER_DATE AND SHIP_DATE TYPE


---------------created another table and updated after "-"------------------
create or replace table sales_data_copy as 
select * from sales_data;

select * from sales_data_copy;

alter table sales_data_copy
add column only_id varchar(20);

update sales_data_copy set only_id = substr(order_id,4); 

------------------- created the new discount table ------------

select *,
case
when discount > 0 then 'Yes'
else 'False'
end as discount_check
from sales_data_copy;

----------final profit -------------
select * from sales_data_copy;
select * ,(profit-shipping_cost) as final_profit from sales_data_copy;

-----------------------------------HOW MUCH DAYS TAKEN FOR EACH ORDER TO PROCESS FOR THE SHIPMENT ------------------

select * from sales_data_copy;

select *, to_date(ship_date) - to_date(order_date) as time_for_order_placed from sales_data_copy;

-------------------- PROCESS DAY AS BY RATING ----------------

select *,
case when to_date(ship_date) - to_date(order_date) <= 3 then '5'
when to_date(ship_date) - to_date(order_date) > 3 and to_date(ship_date) - to_date(order_date) <=6 then '4'
when to_date(ship_date) - to_date(order_date) < 10 and to_date(ship_date) - to_date(order_date) >= 6 then '3'
else '2'
end as rating
from sales_data_copy;





