set search_path to ss9_lt4;

CREATE TABLE Sales (
                       sale_id SERIAL PRIMARY KEY,
                       customer_id INT NOT NULL,
                       product_id INT, -- Thêm product_id để đầy đủ thông tin
                       amount NUMERIC,
                       sale_date DATE
);
INSERT INTO Sales (customer_id, product_id, amount, sale_date)
VALUES
    (1001, 101, 50000.00, '2023-11-15'), -- Giữa tháng 11
    (1002, 102, 120000.50, '2023-11-15'),
    (1003, 103, 35000.00, '2023-11-20'), -- Giao dịch vào ngày 20
    (1001, 104, 78000.99, '2023-11-25'),
    (1004, 105, 99900.00, '2023-12-01'), -- Giao dịch vào tháng 12
    (1005, 106, 45000.00, '2023-12-05'),
    (1006, 107, 220000.00, '2023-12-05'),
    (1007, 108, 150000.00, '2023-12-10'),
    (1008, 109, 60000.00, '2023-12-10'),
    (1009, 110, 30000.00, '2023-12-15');

-- Tạo Procedure calculate_total_sales(start_date DATE, end_date DATE, OUT total NUMERIC) để tính tổng amount trong khoảng start_date đến end_date
create or replace procedure calculate_total_sales(start_date_in date, end_date_in date, out total numeric)
language plpgsql
as $$
    begin
        select sum(amount)
            from Sales
            into total
            where sale_date between start_date_in and end_date_in;
    end;
$$;
-- Gọi Procedure với các ngày mẫu và hiển thị kết quả
call calculate_total_sales('2023-11-15', '2023-12-01', null);