set search_path to quanlynhanvienpractice;

CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

-- Thêm 6 nhân viên mới
INSERT INTO Employee (full_name, department, salary, hire_date)
VALUES
    ('Nguyễn Văn An', 'IT', 12000000, '2023-03-15'),
    ('Trần Mỹ Linh', 'HR', 5500000, '2022-11-20'),
    ('Phạm Hoàng Anh', 'IT', 14000000, '2023-07-10'),
    ('Lê Quốc Bảo', 'Marketing', 4500000, '2023-01-05'),
    ('Đỗ Minh Tuấn', 'Finance', 8000000, '2023-09-18'),
    ('Vũ Hải Nam', 'IT', 3000000, '2021-06-09');


-- Cập nhật mức lương tăng 10% cho nhân viên thuộc phòng IT
update Employee set salary = salary*1.1
where department = 'IT';
-- Xóa nhân viên có mức lương dưới 6,000,000
delete from Employee
where salary < 6000000;
-- Liệt kê các nhân viên có tên chứa chữ “An” (không phân biệt hoa thường)
select * from Employee
where full_name ilike '%An%';
-- Hiển thị các nhân viên có ngày vào làm việc trong khoảng từ '2023-01-01' đến '2023-12-31'
select * from Employee
where hire_date between '2023-01-01' and '2023-12-31';
