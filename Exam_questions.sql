Create database exam_university;

use exam_university;

create table Department (
Dept_no int primary key,
Dept_name varchar(10),
Location varchar(30) 
);

create table Employee (
Emp_no int primary key,
Emp_name varchar(10),
Street varchar(10),
City varchar(10),
Job varchar(10),
Hire_date date,
Salary numeric(8, 2),
Dept_no int
);

alter table Employee
add foreign key (Dept_no) references Department(Dept_no);

insert into Department (Dept_no, Dept_name, Location)
values 
(1, 'CSE', 'Near SOE'),
(2, 'Civil', 'Close SOE'),
(3, 'MCJ', 'Near Aminity'),
(4, 'Energy', 'Near Community Hall'),
(5, 'Education', 'Near Bus Stand'),
(6, 'LAW', 'Near TMH-1');

select * from Department;

insert into Employee (Emp_no, Emp_name, Street, City, Job, Hire_date, Salary, Dept_no)
values
(101, 'Abhijeet Verma', 'Kakadew', 'kanpur' 'Data Scientist', '1980-01-07', 50000.00, 'CSE')
(102, 'Rizwan Shah', 'Dumariyaganj', 'Siddharthnagar', 'Data Analytist', '1985-05-05', 90000.00, 'CSE')
(103, 'Atul Prakash', 'XYZ', 'Bihar', 'AI Agent', '1967-07-01', 40000.00, 'CSE')
(104, 'Bhuban Narzari', '