set  search_path to ss9_lt2;

CREATE TABLE Users (
                       user_id SERIAL PRIMARY KEY,
                       email VARCHAR(100) UNIQUE NOT NULL, -- Đảm bảo email là duy nhất và không NULL
                       username VARCHAR(50)
);

INSERT INTO Users (email, username)
VALUES
    ('alice.nguyen@example.com', 'alice_nguyen'),
    ('bob.le@example.com', 'bob_le'),
    ('charlie.tran@example.com', 'charlie_tran'),
    ('david.pham@example.com', 'david_pham'),
    ('eva.hoang@example.com', 'eva_hoang'),
    ('frank.do@example.com', 'frank_do'),
    ('grace.vu@example.com', 'grace_vu'),
    ('henry.bui@example.com', 'henry_bui'),
    ('ivy.duong@example.com', 'ivy_duong'),
    ('jack.mai@example.com', 'jack_mai');

CREATE EXTENSION pg_trgm; CREATE EXTENSION btree_gin;
-- Tạo Hash Index trên cột email
create index idx_email_hash on Users using hash (email);
-- Viết truy vấn SELECT * FROM Users WHERE email = 'example@example.com'; và kiểm tra kế hoạch thực hiện bằng EXPLAIN
explain
select * from Users where email = 'example@example.com';