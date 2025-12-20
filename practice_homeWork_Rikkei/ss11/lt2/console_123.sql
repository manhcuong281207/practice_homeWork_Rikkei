CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           name VARCHAR(50),
                           email VARCHAR(50)
);
CREATE TABLE customer_log (
                              log_id SERIAL PRIMARY KEY,
                              customer_name VARCHAR(50),
                              action_time TIMESTAMP
);

INSERT INTO customers (name, email)
VALUES
    ('Nguyen Van A', 'a@gmail.com'),
    ('Tran Thi B', 'b@gmail.com'),
    ('Le Van C', 'c@gmail.com');


CREATE OR REPLACE FUNCTION fn_log_new_customer()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO customer_log (customer_name, action_time)
    VALUES (NEW.name, NOW());

    RETURN NEW;
END;
$$;
CREATE TRIGGER trg_after_insert_customer
    AFTER INSERT
    ON customers
    FOR EACH ROW
EXECUTE FUNCTION fn_log_new_customer();
