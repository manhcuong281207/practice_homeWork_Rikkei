set search_path to ss6_lt4;

CREATE TABLE OrderInfo (
                           id SERIAL PRIMARY KEY,
                           customer_id INT,
                           order_date DATE,
                           total NUMERIC(10,2),
                           status VARCHAR(20)
);
INSERT INTO OrderInfo (customer_id, order_date, total, status) VALUES
                                                                   (1, '2024-10-05', 600000, 'Completed'),
                                                                   (2, '2024-10-15', 450000, 'Pending'),
                                                                   (3, '2024-11-01', 1200000, 'Shipping'),
                                                                   (1, '2024-10-20', 300000, 'Cancelled'),
                                                                   (4, '2024-12-10', 800000, 'Completed');

SELECT * FROM OrderInfo
WHERE total > 500000;

SELECT * FROM OrderInfo
WHERE order_date >= '2024-10-01' AND order_date <= '2024-10-31';

SELECT * FROM OrderInfo
WHERE status <> 'Completed';

SELECT * FROM OrderInfo
ORDER BY order_date DESC
LIMIT 2;