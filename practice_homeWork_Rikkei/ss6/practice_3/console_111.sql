set search_path to ss6_lt3;

CREATE TABLE Customer (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100),
                          email VARCHAR(100),
                          phone VARCHAR(20),
                          points INT
);
INSERT INTO Customer (name, email, phone, points) VALUES
                                                      ('Nguyen Van A', 'a@gmail.com', '0912345678', 100),
                                                      ('Tran Thi B', 'b@gmail.com', '0922345678', 250),
                                                      ('Le Van C', NULL, '0932345678', 50), -- Khách hàng không có email
                                                      ('Pham Minh D', 'd@gmail.com', '0942345678', 300),
                                                      ('Hoang Thi E', 'e@gmail.com', '0952345678', 150),
                                                      ('Vu Van F', 'f@gmail.com', '0962345678', 400),
                                                      ('Dang Thi G', 'g@gmail.com', '0972345678', 200);

SELECT DISTINCT name FROM Customer;

SELECT * FROM Customer WHERE email IS NULL;

SELECT * FROM Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

SELECT * FROM Customer
ORDER BY name DESC;