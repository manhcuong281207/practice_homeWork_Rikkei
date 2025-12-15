set search_path to;

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount NUMERIC
);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
    (1001, '2023-11-01', 500000.00),
    (1002, '2023-11-01', 120000.50),
    (1001, '2023-11-02', 350000.00), -- Khách hàng 1001 có nhiều đơn
    (1003, '2023-11-03', 78000.99),
    (1004, '2023-11-04', 999000.00),
    (1002, '2023-11-05', 45000.00), -- Khách hàng 1002 có nhiều đơn
    (1005, '2023-11-06', 220000.00),
    (1006, '2023-11-07', 150000.00),
    (1001, '2023-11-08', 60000.00), -- Khách hàng 1001 có nhiều đơn
    (1007, '2023-11-09', 30000.00);

-- Tạo một B-Tree Index trên cột customer_id
    create index idx_custommer_id on Orders(customer_id);
-- Thực hiện truy vấn SELECT * FROM Orders WHERE customer_id = X; trước và sau khi tạo Index, so sánh thời gian thực hiện
SET enable_seqscan = OFF;
explain
select * from Orders
where customer_id = 1001;
