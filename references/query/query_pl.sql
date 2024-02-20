SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(revenue) /100 AS total_revenue ,
    SUM(order_cost) /100 AS total_cost ,
    SUM(order_pl)/100 AS total_profit 
FROM
    teddy_retailers_finance.orders_pl
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;
