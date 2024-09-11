CREATE DATABASE OnlineShop;
USE OnlineShop;

-- Select queries
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;

-- Creating tables
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    position VARCHAR(50)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    served_by_employee_id INT,
    FOREIGN KEY (served_by_employee_id) REFERENCES employees(id) ON DELETE SET NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Populating tables with dummy data
INSERT INTO employees (first_name, last_name, hire_date, position) VALUES
('John', 'Doe', '2022-01-15', 'Sales Representative'),
('Jane', 'Smith', '2021-05-10', 'Customer Service'),
('Mark', 'Johnson', '2020-09-30', 'Manager'),
('Emily', 'Davis', '2019-11-21', 'Sales Associate');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 899.99, 25),
('Headphones', 'Electronics', 49.99, 100),
('Desk Chair', 'Furniture', 149.99, 50),
('Smartphone', 'Electronics', 699.99, 30),
('Coffee Table', 'Furniture', 89.99, 20);

INSERT INTO customers (first_name, last_name, email, served_by_employee_id) VALUES
('Alice', 'Brown', 'alice.brown@email.com', 1),
('Bob', 'Green', 'bob.green@email.com', 2),
('Charlie', 'White', 'charlie.white@email.com', 3),
('Diana', 'Black', 'diana.black@email.com', 4);

INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2023-09-01', 1),  -- Alice bought 1 Laptop
(1, 2, '2023-09-01', 2),  -- Alice bought 2 Headphones
(2, 3, '2023-09-02', 1),  -- Bob bought 1 Desk Chair
(3, 4, '2023-09-03', 1),  -- Charlie bought 1 Smartphone
(4, 5, '2023-09-04', 1);  -- Diana bought 1 Coffee Table
