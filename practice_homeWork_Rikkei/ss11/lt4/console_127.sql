CREATE OR REPLACE FUNCTION reduce_stock_func()
    RETURNS TRIGGER AS $$
BEGIN
    -- Cập nhật giảm số lượng stock tương ứng trong bảng products
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_after_insert_sales
    AFTER INSERT ON sales
    FOR EACH ROW
EXECUTE FUNCTION reduce_stock_func();

INSERT INTO products (name, stock) VALUES ('Chuột không dây', 100);
-- Giả sử ID của sản phẩm này là 1.

INSERT INTO sales (product_id, quantity) VALUES (1, 10);

SELECT * FROM products WHERE product_id = 1;