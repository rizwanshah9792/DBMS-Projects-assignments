CREATE DATABASE LabFifthApril;

USE LabFifthApril;

CREATE TABLE Employee (
Emp_name varchar(20) primary key,
Street varchar(10),
City varchar(10)
);

CREATE TABLE Works (
Emp_name varchar(20) primary key,
Comp_name varchar(20),
Salary numeric(10, 2)
);

CREATE TABLE Company (
Comp_name varchar(20) primary key,
City varchar(10)
);

CREATE TABLE Manages (
Emp_name varchar(20) primary key,
Manager_name varchar(20)
);

INSERT INTO Employee (Emp_name, Street, City)
VALUES
('Rizwan', 'street 1', 'city_1'),
('Ayush', 'street 2', 'city_2'),
('Mayuri', 'street 2', 'city_2'),
('Atul', 'street 4', 'city_4'),
('Bhuban', 'street 4', 'city_5'),
('Abhijeet', 'street 1', 'city_6');

INSERT INTO Works (Emp_name, Comp_name, Salary)
VALUES
('Rizwan', 'FBC', 20000),
('Ayush', 'SBC', 15000),
('Mayuri', 'ABC', 9000),
('Atul', 'FBC', 22000),
('Bhuban', 'SBC', 35000),
('Abhijeet', 'PBC', 13000);

INSERT INTO Company (Comp_name, City)
VALUES
('FBC', 'Tezpur'),
('SBC', 'Snagar'),
('ABC', 'Guwahati'),
('PBC', 'Kanpur'),
('RBC', 'Tezpur');

INSERT INTO Manages (Emp_name, Manager_name)
VALUES
('Rizwan', 'John'),
('Ayush', 'Yan'),
('Mayuri', 'Xin Pon'),
('Atul', 'Jhon'),
('Bhuban', 'Elon Musk'),
('Abhijeet', 'XYZ');

select * from Employee;
select * from Works;
select * from Company;
select * from Manages;

alter table Works
add foreign key (Emp_name) references Employee(Emp_name),
add foreign key (Comp_name) references Company(Comp_name);

alter table Manages
add foreign key (Emp_name) references Employee(Emp_name);


-- 1. Find the names and cities of residence of all employees who work for First Bank Coorporation (FBC).
select Employee.Emp_name, Employee.City 
from Employee
join Works on Employee.Emp_name = Works.Emp_name
where Works.Comp_name = 'FBC';

-- 2. Find the names street addresses and cities of residence of all employees, who works for FBC and earns more than $10000.
select Employee.Emp_name, Employee.Street, Employee.City
From Employee
join Works on Employee.Emp_name = Works.Emp_name
Where Works.Comp_name = 'FBC' and Works.Salary > 10000;

-- 3. Assume that the company may be located in several cities. Find all companies located in every city in which small bank coorporation is located
select Company.Comp_name, Company.City
from Company
having Company.City = (select Company.City from Company where Comp_name = 'SBC');

-- 4. Find the company that has the more employes.
select Works.Comp_name
from Works
group by Works.Comp_name
order by count(Comp_name) desc
limit 1;

-- 5. Find those companies whose employees are a highest salary on average than the average salary of FBC.
select Works.Comp_name, round(avg(Works.Salary), 2) as Avg_Salary
from Works
group by Works.Comp_name
having avg(Works.Salary) > (
    select avg(Salary) from Works where Comp_name = 'FBC'
);
