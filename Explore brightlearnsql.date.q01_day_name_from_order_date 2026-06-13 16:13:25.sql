-- Databricks notebook source
--Q1
SELECT order_id, customer_id, order_date,DAYNAME(order_date) AS day_name
FROM brightlearnsql.date.q01_day_name_from_order_date;
--Q2
SELECT customer_id,customer_name,signup_date,MONTHNAME(signup_date) AS signup_month_name
FROM brightlearnsql.date.q02_month_name_from_signup_date; 
--Q3
SELECT sale_id,product_name,sale_date,MONTH(sale_date) AS sale_month
FROM brightlearnsql.date.q03_month_number_from_sale_date;
--Q4
SELECT transaction_id,customer_id,transaction_date,YEAR(transaction_date)AS transaction_year
FROM brightlearnsql.date.q04_year_from_transaction_date;
--Q5
SELECT delivery_id,customer_id,delivery_date,DAY(delivery_date) AS day_of_month
FROM brightlearnsql.date.q05_day_of_month_from_delivery_date;
--Q6
SELECT employee_id,employee_name,department,CURRENT_DATE() AS today_date
FROM brightlearnsql.date.q06_add_todays_date;
--Q7 
SELECT order_id, customer_id, order_date_text,TO_DATE(order_date_text,'MM/dd/yyyy') AS order_date
FROM brightlearnsql.date.q07_convert_text_to_date;
--Q8
SELECT payment_id, customer_id, payment_date,
TO_CHAR(payment_date,'yyyy-MM-dd') AS formatted_payment_date
FROM brightlearnsql.date.q08_format_date_as_text;
--Q9
SELECT customer_id, customer_name, last_purchase_date, DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase FROM brightlearnsql.date.q09_days_since_last_purchase;
---Q10
SELECT order_id, customer_id, order_date, DATEADD(day,7,order_date) AS expected_delivery_date FROM brightlearnsql.date.q10_expected_delivery_date;
--Q11
SELECT booking_id, customer_id, booking_date, EXTRACT(YEAR FROM booking_date) AS booking_year,
EXTRACT(MONTH FROM booking_date) AS booking_month, EXTRACT(DAY FROM booking_date) AS booking_day FROM brightlearnsql.date.q11_year_month_day_separately;
--Q12
SELECT order_id,
customer_id,
order_date,
YEAR(order_date) AS order_year,
Amount FROM brightlearnsql.date.q12_filter_orders_from_2026 WHERE YEAR(order_date)=2026;
--Q13
SELECT order_id,
customer_id,
order_date, MONTH(order_date) AS order_month, amount FROM brightlearnsql.date.q13_filter_orders_from_march WHERE MONTH(order_date)=3;
--Q14
SELECT subscription_id,
customer_id,
start_date, DAY(start_date) AS month_end_date FROM brightlearnsql.date.q14_last_day_of_the_month;
--Q15
SELECT send_id,
customer_id,
send_date, DATE_TRUNC('DAY',send_date) AS month_start_date FROM brightlearnsql.date.q15_first_day_of_the_month;
--Q16
SELECT invoice_id,
customer_id,
invoice_date, TO_CHAR(invoice_date,'MMMM yyyy') AS invoice_month_year FROM brightlearnsql.date.q16_format_as_month_and_year;
--Q17
SELECT
customer_id,
customer_name,
date_of_birth,
YEAR(CURRENT_DATE())-YEAR(date_of_birth) AS customer_age
FROM brightlearnsql.date.q17_customer_age_from_date_of_birth;
--Q18
SELECT
order_id,
customer_id,
order_date,
DAYNAME(order_date) AS day_name,

CASE
    WHEN DAYNAME(order_date) IN ('Saturday','Sunday') THEN 'Weekend'
    ELSE 'Weekday'
END AS day_type
FROM brightlearnsql.date.q18_classify_weekend_vs_weekday;
--Q19
SELECT transaction_id,
customer_id,
transaction_date,
QUARTER(transaction_date) AS 
transaction_quarter, amount FROM brightlearnsql.date.q19_transactions_by_quarter;
---Q20
SELECT
order_id,
customer_id,
order_id, DATEDIFF(CURRENT_DATE(),order_date) AS days_since_order, amount FROM brightlearnsql.date.q20_orders_older_than_30_days
WHERE DATEDIFF(CURRENT_DATE(),order_date)>30;

