--  Create database
CREATE DATABASE  FoodOrderingApp;
--  Use Database
USE FoodOrderingApp;
--  Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

--  Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15)
);

--  Items Table
CREATE TABLE Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

--  Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

--  Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);

--  Sample Data Insertions

-- Users Data
INSERT INTO Users (name, email, phone, address) VALUES
('Sruti', 'sruti@gmail.com', '9876543210', 'Delhi, India'),
('Aditya Kumar', 'aditya@gmail.com', '9123456780', 'Mumbai, India');

-- Restaurants Data
INSERT INTO Restaurants (name, address, phone) VALUES
('Pizza House', 'Sector 21, Noida', '9012345678'),
('Burger Corner', 'MG Road, Bangalore', '9988776655');

-- Items Data
INSERT INTO Items (name, price, restaurant_id) VALUES
('Cheese Pizza', 250.00, 1),
('Veg Burger', 120.00, 2),
('French Fries', 80.00, 2),
('Paneer Pizza', 300.00, 1);

-- Orders Data
INSERT INTO Orders (user_id, total_amount, status) VALUES
(1, 370.00, 'Placed'),
(2, 200.00, 'Delivered');

-- Order_Items Data
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 2);

--  Example Query: Show order details
SELECT Orders.order_id, Users.name AS customer_name, Items.name AS item_name, Order_Items.quantity
FROM Orders
JOIN Users ON Orders.user_id = Users.user_id
JOIN Order_Items ON Orders.order_id = Order_Items.order_id
JOIN Items ON Order_Items.item_id = Items.item_id;
