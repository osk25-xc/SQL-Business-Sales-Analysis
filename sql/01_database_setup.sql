CREATE DATABASE IF NOT EXISTS ecommerce_sales;

USE ecommerce_sales;

CREATE TABLE IF NOT EXISTS sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);