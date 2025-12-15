set search_path to ss9_lt3;

CREATE TABLE Sales (
                       sale_id SERIAL PRIMARY KEY,
                       customer_id INT NOT NULL,
                       product_id INT NOT NULL,
                       sale_date DATE,
                       amount NUMERIC
);

INSERT INTO Sales (customer_id, product_id, sale_date, amount)
VALUES
    (1001, 101, '2023-10-01', 50.00),   -- Khách hàng 1001 mua 3 lần
    (1002, 102, '2023-10-01', 120.50),
    (1001, 103, '2023-10-02', 35.00),   -- Khách hàng 1001 mua 3 lần
    (1003, 101, '2023-10-03', 78.99),
    (1004, 104, '2023-10-04', 999.00),
    (1002, 105, '2023-10-05', 45.00),
    (1005, 106, '2023-10-06', 220.00),
    (1006, 107, '2023-10-07', 150.00),
    (1001, 108, '2023-10-08', 60.00),   -- Khách hàng 1001 mua 3 lần
    (1007, 109, '2023-10-09', 30.00);


-- Tạo View CustomerSales tổng hợp tổng amount theo từng customer_id
create view CustomerSales as
    select customer_id, sum(amount) as total_amount
from Sales
group by customer_id;
-- Viết truy vấn SELECT * FROM CustomerSales WHERE total_amount > 1000; để xem khách hàng mua nhiều
select * from CustomerSales
where total_amount > 1000;
-- Thử cập nhật một bản ghi qua View và quan sát kết quả
update CustomerSales
set total_amount = 50000
where customer_id = 1001;
--> lỗi