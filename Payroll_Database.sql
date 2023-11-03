USE db_payroll


CREATE TABLE employee (
    employee_id INT NOT null PRIMARY KEY IDENTITY(1,1),
    job_id INT NOT NULL,
    first_name VARCHAR(50) not null ,
    last_name VARCHAR(50) not null,
    date_of_hire DATE
);

CREATE TABLE job (
    job_id INT NOt null PRIMARY KEY IDENTITY(1,1),
    job_title VARCHAR(50) not null ,
    job_dept VARCHAR(50) not null ,
    salary_id INT not null
);

CREATE TABLE salary (
    salary_id INT NOt null PRIMARY KEY IDENTITY(1,1),
    hourly_rate MONEY not NULL
);

CREATE TABLE payroll (
    payroll_date DATE,
    employee_id INT NOT NULL,
    hours_worked INT NOT NULL
);

Alter Table employee 
ADD FOREIGN KEY (job_id) REFERENCES job(job_id);

Alter Table payroll 
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

Alter Table job 
ADD FOREIGN KEY (salary_id) REFERENCES salary(salary_id);

INSERT INTO salary VALUES
(19.50),
(20.00),
(20.50),
(21.00),
(21.50);

INSERT INTO job VALUES
('AR Director','Accounting',2),
('HR Director','Human Resources',4),
('Developer','IT',5),
('Customer Service Manager','Operations',3),
('Sales Manager','Sales and Marketing',1);


INSERT INTO employee
VALUES
    (1, 'Sam', 'Smith', '2018-11-28'),
    (4, 'Amanda', 'James', '2020-04-01'),
    (3, 'David', 'McGrath', '2021-12-11'),
    (2, 'Valerie', 'Ringer', '2014-07-31'),
    (5, 'Andrea', 'Antivilo', '2019-02-04');

SELECT * FROM employee


INSERT INTO payroll
VALUES
    ('2023-06-07', 1, 40),
    ('2023-06-07', 2, 25),
    ('2023-06-07', 3, 38),
    ('2023-06-07', 4, 22),
    ('2023-06-07', 5, 34);

SELECT * FROM payroll


SELECT * FROM employee 
    inner join payroll ON employee.employee_id = payroll.employee_id
    inner join job on employee.job_id = job.job_id
    inner join salary on job.salary_id = salary.salary_id

SELECT  employee.first_name AS 'first name',
        employee.last_name as 'last name',
        payroll.hours_worked as 'hours',
        payroll.hours_worked * salary.hourly_rate as 'total pay:',
        (Payroll.hours_worked * salary.hourly_rate * 0.8) as 'total pay After Tax:'
        FROM employee
        inner join payroll ON employee.employee_id = payroll.employee_id
        inner join job on employee.job_id = job.job_id
        inner join salary on job.salary_id = salary.salary_id




SELECT * FROM employee 
    inner join payroll ON employee.employee_id = payroll.employee_id
    inner join job on employee.job_id = job.job_id
    inner join salary on job.salary_id = salary.salary_id