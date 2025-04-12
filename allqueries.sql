-- Create tables

CREATE TABLE country (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE address_status (
  id INT PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(255) NOT NULL
);

CREATE TABLE address (
  id INT PRIMARY KEY AUTO_INCREMENT,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  postal_code VARCHAR(20),
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE customer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE customer_address (
  customer_id INT,
  address_id INT,
  status_id INT,
  PRIMARY KEY (customer_id, address_id),
  FOREIGN KEY (customer_id) REFERENCES customer(id),
  FOREIGN KEY (address_id) REFERENCES address(id),
  FOREIGN KEY (status_id) REFERENCES address_status(id)
);

CREATE TABLE author (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE book_language (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE publisher (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE book (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  language_id INT,
  publisher_id INT,
  published_date DATE,
  price DECIMAL(10, 2),
  FOREIGN KEY (language_id) REFERENCES book_language(id),
  FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  PRIMARY KEY (book_id, author_id),
  FOREIGN KEY (book_id) REFERENCES book(id),
  FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE shipping_method (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  cost DECIMAL(10, 2)
);

CREATE TABLE order_status (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE cust_order (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  shipping_id INT,
  order_date DATETIME,
  FOREIGN KEY (customer_id) REFERENCES customer(id),
  FOREIGN KEY (shipping_id) REFERENCES shipping_method(id)
);

CREATE TABLE order_line (
  order_id INT,
  book_id INT,
  quantity INT,
  PRIMARY KEY (order_id, book_id),
  FOREIGN KEY (order_id) REFERENCES cust_order(id),
  FOREIGN KEY (book_id) REFERENCES book(id)
);

CREATE TABLE order_history (
  order_id INT,
  status_id INT,
  updated_at DATETIME,
  PRIMARY KEY (order_id, status_id),
  FOREIGN KEY (order_id) REFERENCES cust_order(id),
  FOREIGN KEY (status_id) REFERENCES order_status(id)
);

-- Insert data into country
INSERT INTO country (name) VALUES
('United States'),
('United Kingdom'),
('Germany'),
('India'),
('Australia');

-- Insert data into address_status
INSERT INTO address_status (description) VALUES
('Current'),
('Old'),
('Temporary');

-- Insert data into address
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Elm St', 'New York', '10001', 1),
('456 Oak St', 'London', 'E1 6AN', 2),
('789 Pine St', 'Berlin', '10115', 3),
('101 Maple St', 'Mumbai', '400001', 4),
('202 Birch St', 'Sydney', '2000', 5);

-- Insert data into customer
INSERT INTO customer (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Williams', 'bob.williams@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('Diana', 'Moore', 'diana.moore@example.com'),
('Ethan', 'Taylor', 'ethan.taylor@example.com');

-- Insert data into customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1), -- Alice's current address
(2, 2, 2), -- Bob's old address
(3, 3, 1), -- Charlie's current address
(4, 4, 3), -- Diana's temporary address
(5, 5, 1); -- Ethan's current address

-- Insert data into author
INSERT INTO author (name) VALUES
('John Doe'),
('Jane Smith'),
('Mark Johnson'),
('Emily Davis'),
('Robert Brown');

-- Insert data into book_language
INSERT INTO book_language (name) VALUES
('English'),
('Spanish'),
('French'),
('German'),
('Chinese');

-- Insert data into publisher
INSERT INTO publisher (name) VALUES
('Penguin Books'),
('HarperCollins'),
('Macmillan'),
('Oxford University Press'),
('Pearson');

-- Insert data into book
INSERT INTO book (title, language_id, publisher_id, published_date, price) VALUES
('The Great Adventure', 1, 1, '2021-06-01', 19.99),
('Learning SQL', 2, 2, '2020-03-15', 29.99),
('Mastering C++', 3, 3, '2019-08-21', 39.99),
('Understanding Java', 1, 4, '2018-04-12', 49.99),
('Intro to Python', 1, 5, '2022-07-10', 24.99);

-- Insert data into book_author
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), -- The Great Adventure by John Doe
(2, 2), -- Learning SQL by Jane Smith
(3, 3), -- Mastering C++ by Mark Johnson
(4, 4), -- Understanding Java by Emily Davis
(5, 5); -- Intro to Python by Robert Brown

-- Insert data into shipping_method
INSERT INTO shipping_method (name, cost) VALUES
('Standard Shipping', 5.99),
('Express Shipping', 9.99),
('Overnight Shipping', 19.99);

-- Insert data into order_status
INSERT INTO order_status (name) VALUES
('Pending'),
('Shipped'),
('Delivered'),
('Cancelled');

-- Insert data into cust_order
INSERT INTO cust_order (customer_id, shipping_id, order_date) VALUES
(1, 1, '2023-04-01 14:30:00'), -- Alice's order
(2, 2, '2023-04-02 16:45:00'), -- Bob's order
(3, 3, '2023-04-03 11:00:00'), -- Charlie's order
(4, 1, '2023-04-04 09:15:00'), -- Diana's order
(5, 3, '2023-04-05 12:30:00'); -- Ethan's order

-- Insert data into order_line
INSERT INTO order_line (order_id, book_id, quantity) VALUES
(1, 1, 2), -- Alice's order: 2 copies of The Great Adventure
(2, 2, 1), -- Bob's order: 1 copy of Learning SQL
(3, 3, 1), -- Charlie's order: 1 copy of Mastering C++
(4, 4, 1), -- Diana's order: 1 copy of Understanding Java
(5, 5, 2); -- Ethan's order: 2 copies of Intro to Python

-- Insert data into order_history
INSERT INTO order_history (order_id, status_id, updated_at) VALUES
(1, 1, '2023-04-01 14:30:00'), -- Alice's order is pending
(2, 2, '2023-04-02 16:45:00'), -- Bob's order is shipped
(3, 3, '2023-04-03 11:00:00'), -- Charlie's order is delivered
(4, 1, '2023-04-04 09:15:00'), -- Diana's order is pending
(5, 2, '2023-04-05 12:30:00'); -- Ethan's order is shipped
