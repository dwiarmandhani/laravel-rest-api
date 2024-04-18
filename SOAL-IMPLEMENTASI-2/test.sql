-- Membuat database db_test
CREATE DATABASE IF NOT EXISTS db_test;

-- Menggunakan database db_test
USE db_test;

-- Membuat tabel employees
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    job_title VARCHAR(255),
    salary INT,
    department VARCHAR(255),
    joined_date DATE
);

-- Memasukkan data ke dalam tabel employees
INSERT INTO employees (employee_id, name, job_title, salary, department, joined_date) VALUES
(1, 'John Smith', 'Manager', 60000, 'Sales', '2022-01-15'),
(2, 'Jane Doe', 'Analyst', 45000, 'Marketing', '2022-02-01'),
(3, 'Mike Brown', 'Developer', 55000, 'IT', '2022-03-10'),
(4, 'Anna Lee', 'Manager', 65000, 'Sales', '2021-12-05'),
(5, 'Mark Wong', 'Developer', 50000, 'IT', '2023-05-20'),
(6, 'Emily Chen', 'Analyst', 48000, 'Marketing', '2023-06-02');

-- Membuat tabel sales_data
CREATE TABLE IF NOT EXISTS sales_data (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    sales INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Memasukkan data ke dalam tabel sales_data
INSERT INTO sales_data (sales_id, employee_id, sales) VALUES
(1, 1, 15000),
(2, 2, 12000),
(3, 3, 18000),
(4, 1, 20000),
(5, 4, 22000),
(6, 5, 19000),
(7, 6, 13000),
(8, 2, 14000);


--SOAL
-- Tampilkan seluruh data dari tabel "employees"
SELECT * FROM employees;

-- Berapa banyak karyawan yang memiliki posisi pekerjaan (job title) "Manager"?
SELECT COUNT(*) AS total_managers FROM employees WHERE job_title = 'Manager';

-- Tampilkan daftar nama dan gaji (salary) dari karyawan yang bekerja di departemen "Sales" atau "Marketing"
SELECT name, salary FROM employees WHERE department IN ('Sales', 'Marketing');

-- Hitung rata-rata gaji (salary) dari karyawan yang bergabung (joined) dalam 5 tahun terakhir (berdasarkan kolom "joined_date")
SELECT AVG(salary) AS average_salary FROM employees WHERE joined_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR);

-- Tampilkan 5 karyawan dengan total penjualan (sales) tertinggi dari tabel "employees" dan "sales_data"
SELECT e.name, SUM(sd.sales) AS total_sales
FROM employees e
JOIN sales_data sd ON e.employee_id = sd.employee_id
GROUP BY e.name
ORDER BY total_sales DESC
LIMIT 5;

-- Tampilkan nama, gaji (salary), dan rata-rata gaji (salary) dari semua karyawan yang bekerja di departemen yang memiliki rata-rata gaji lebih tinggi dari gaji rata-rata di semua departemen
SELECT e.name, e.salary, AVG(e2.salary) AS average_department_salary
FROM employees e
JOIN employees e2 ON e.department = e2.department
GROUP BY e.name, e.salary
HAVING e.salary > (SELECT AVG(salary) FROM employees);

-- Tampilkan nama dan total penjualan (sales) dari setiap karyawan, bersama dengan peringkat (ranking) masing-masing karyawan berdasarkan total penjualan. Peringkat 1 adalah karyawan dengan total penjualan tertinggi
SELECT name, total_sales, RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM (
    SELECT e.name, SUM(sd.sales) AS total_sales
    FROM employees e
    JOIN sales_data sd ON e.employee_id = sd.employee_id
    GROUP BY e.name
) AS ranked_sales;

-- Buat sebuah stored procedure yang menerima nama departemen sebagai input, dan mengembalikan daftar karyawan dalam departemen tersebut bersama dengan total gaji (salary) yang mereka terima
CREATE PROCEDURE GetDepartmentEmployees(IN dep_name VARCHAR(255))
BEGIN
    SELECT e.name, e.salary
    FROM employees e
    WHERE e.department = dep_name;
END;
