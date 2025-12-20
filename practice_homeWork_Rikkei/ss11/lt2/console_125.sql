CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          name VARCHAR(50),
                          stock INT CHECK (stock >= 0)
);
CREATE TABLE sales (
                       sale_id SERIAL PRIMARY KEY,
                       product_id INT REFERENCES products(product_id),
                       quantity INT CHECK (quantity > 0)
);
INSERT INTO products (name, stock)
VALUES
    ('Laptop', 10),
    ('Mouse', 50);



CREATE OR REPLACE FUNCTION fn_check_stock_before_sale()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
DECLARE
    current_stock INT;
BEGIN
    -- Lấy số lượng tồn kho
    SELECT stock
    INTO current_stock
    FROM products
    WHERE product_id = NEW.product_id
        FOR UPDATE;

    -- Nếu không tìm thấy sản phẩm
    IF current_stock IS NULL THEN
        RAISE EXCEPTION 'Product does not exist';
    END IF;

    -- Nếu tồn kho không đủ
    IF NEW.quantity > current_stock THEN
        RAISE EXCEPTION
            'Not enough stock. Available: %, Requested: %',
            current_stock, NEW.quantity;
    END IF;

    -- Trừ tồn kho
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$;
CREATE TRIGGER trg_before_insert_sale
    BEFORE INSERT
    ON sales
    FOR EACH ROW
EXECUTE FUNCTION fn_check_stock_before_sale();


INSERT INTO sales (product_id, quantity)
VALUES (1, 3);

INSERT INTO sales (product_id, quantity)
VALUES (1, 20);
