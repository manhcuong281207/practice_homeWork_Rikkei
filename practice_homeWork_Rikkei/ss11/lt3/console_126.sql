CREATE OR REPLACE FUNCTION update_stock_after_sale()
    RETURNS TRIGGER AS $$
BEGIN
    -- Cập nhật giảm stock trong bảng products dựa trên product_id và quantity mới thêm vào sales
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_stock
    AFTER INSERT ON sales
    FOR EACH ROW
EXECUTE FUNCTION update_stock_after_sale();

INSERT INTO products (name, stock) VALUES ('Laptop Dell', 50);

INSERT INTO sales (product_id, quantity) VALUES (1, 5);
