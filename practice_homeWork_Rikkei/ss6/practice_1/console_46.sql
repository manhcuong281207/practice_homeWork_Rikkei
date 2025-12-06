set search_path to quanlysanpham1;

CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);
-- Thêm 5 sản phẩm vào bảng bằng lệnh INSERT
INSERT INTO Product (name, category, price, stock)
VALUES
    ('Laptop Pro 15', 'Electronics', 25000.00, 10),
    ('Smartphone X1', 'Electronics', 15000.00, 25),
    ('Basic T-Shirt', 'Fashion', 199.99, 50),
    ('Running Shoes', 'Fashion', 899.50, 30),
    ('Wooden Desk', 'Furniture', 3200.00, 12);

-- Hiển thị danh sách toàn bộ sản phẩm
select * from Product;
-- Hiển thị 3 sản phẩm có giá cao nhất
select * from Product
order by price desc
limit 3
offset 1;
-- Hiển thị các sản phẩm thuộc danh mục “Điện tử” có giá nhỏ hơn 10,000,000
select * from Product
where category = 'Electronics' and price < 10000000;
-- Sắp xếp sản phẩm theo số lượng tồn kho tăng dần
select * from Product
order by stock asc;