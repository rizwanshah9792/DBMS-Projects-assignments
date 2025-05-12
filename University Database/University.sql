-- Creating University Database
create database University;

use university;

-- Department Table
create table department (
	dept_name varchar(40) primary key,
    building varchar(10),
    budget numeric(12,2)
);

-- Student Table
create table student (
	ID int primary key,
    name varchar(20),
    dept_name varchar(40),
    tot_cred int,
    foreign key (dept_name) references department(dept_name)
);

-- Instructor Table
create table instructor (
	ID int primary key,
    name varchar(20),
    dept_name varchar(40),
    salary numeric(10,2),
    foreign key (dept_name) references department(dept_name)
);

-- Advisor Table
create table advisor (
	s_id int primary key,
    i_id int,
    foreign key (s_id) references student(ID),
    foreign key (i_id) references instructor(ID)
);

-- Course Table
create table course (
	course_id varchar(10) primary key,
    title varchar(40),
    dept_name varchar(40),
    credits int,
    foreign key (dept_name) references department(dept_name)
);

-- Prequired Table
create table prereq (
	course_id varchar(10),
    prereq_id varchar(10),
    primary key (course_id, prereq_id),
    foreign key (course_id) references course(course_id),
    foreign key (prereq_id) references course(course_id)
);

-- Classroom Table
create table classroom (
	building varchar(15),
    room_no int,
    capacity int,
    primary key (building, room_no)
);

-- Time Slot Table
create table time_slot (
	time_slot_id varchar(1),
    day varchar(1),
    start_time time,
    end_time time,
    primary key (time_slot_id, day, start_time)
);

-- Section Table
create table section (
	course_id varchar(10),
    sec_id int,
    semester varchar(10),
    year int,
    building varchar(15),
    room_no int,
    time_slot_id varchar(1),
    primary key (course_id, sec_id, semester, year),
    foreign key (course_id) references course(course_id),
    foreign key (building, room_no) references classroom(building, room_no),
    foreign key (time_slot_id) references time_slot(time_slot_id)
);

-- Teaches Table
create table teaches (
	ID int,
    course_id varchar(10),
    sec_id int,
    semester varchar(10),
    year int,
    primary key (ID, course_id, sec_id, semester),
    foreign key (ID) references instructor(ID),
    foreign key (course_id, sec_id, semester, year) references section(course_id, sec_id, semester, year)
);

-- Takes Table
create table takes (
	ID int,
    course_id varchar(10),
    sec_id int,
    semester varchar(10),
    year int,
    grade varchar(2),
    primary key (ID, course_id, sec_id, semester, year),
    foreign key (ID) references student(ID),
    foreign key (course_id, sec_id, semester, year) references section(course_id, sec_id, semester, year)
);

-- Faculty Table
create table faculty (
    ID int primary key,
    name varchar(20),
    salary numeric(10,2),
    dept_name varchar(40),
    building varchar(10),
    budget numeric(12,2),
    foreign key (dept_name) references department(dept_name)
);

-- Insertion of Data into the Tables

-- 1. Insert into department
INSERT INTO department (dept_name, building, budget) VALUES
('Biology', 'Watson', 90000.00),
('Comp. Sci.', 'Taylor', 100000.00),
('Elec. Eng.', 'Taylor', 85000.00),
('Finance', 'Painter', 120000.00),
('History', 'Painter', 50000.00),
('Music', 'Packard', 80000.00),
('Physics', 'Watson', 70000.00);

-- 2. Insert into classroom
INSERT INTO classroom (building, room_no, capacity) VALUES
('Packard', 101, 500),
('Painter', 514, 10),
('Taylor', 3128, 70),
('Watson', 100, 30),
('Watson', 120, 50);

-- 3. Insert into time_slot
INSERT INTO time_slot (time_slot_id, day, start_time, end_time) VALUES
('A', 'M', '08:00:00', '08:50:00'),
('A', 'W', '08:00:00', '08:50:00'),
('A', 'F', '08:00:00', '08:50:00'),
('B', 'M', '09:00:00', '09:50:00'),
('B', 'W', '09:00:00', '09:50:00'),
('B', 'F', '09:00:00', '09:50:00'),
('C', 'M', '11:00:00', '11:50:00'),
('C', 'W', '11:00:00', '11:50:00'),
('C', 'F', '11:00:00', '11:50:00'),
('D', 'M', '13:00:00', '13:50:00'),
('D', 'W', '13:00:00', '13:50:00'),
('D', 'F', '13:00:00', '13:50:00'),
('E', 'T', '10:30:00', '11:45:00'),
('E', 'R', '10:30:00', '11:45:00'),
('F', 'T', '14:30:00', '15:45:00'),
('F', 'R', '14:30:00', '15:45:00'),
('G', 'M', '16:00:00', '16:50:00'),
('G', 'W', '16:00:00', '16:50:00'),
('H', 'F', '16:00:00', '16:50:00');

-- 4. Insert into student
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES
(128, 'Zhang', 'Comp. Sci.', 102),
(12345, 'Shankar', 'Comp. Sci.', 32),
(19991, 'Brandt', 'History', 80),
(23121, 'Chavez', 'Finance', 110),
(44553, 'Peltier', 'Physics', 56),
(45678, 'Levy', 'Physics', 46),
(54321, 'Williams', 'Comp. Sci.', 54),
(55739, 'Sanchez', 'Music', 38),
(70557, 'Snow', 'Physics', 0),
(76543, 'Brown', 'Comp. Sci.', 58),
(76653, 'Aoi', 'Elec. Eng.', 60),
(98765, 'Bourikas', 'Elec. Eng.', 98),
(98988, 'Tanaka', 'Biology', 120);

-- 5. Insert into instructor
INSERT INTO instructor (ID, name, dept_name, salary) VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000.00),
(12121, 'Wu', 'Finance', 90000.00),
(15151, 'Mozart', 'Music', 40000.00),
(22222, 'Einstein', 'Physics', 95000.00),
(32343, 'El Said', 'History', 60000.00),
(33456, 'Gold', 'Physics', 87000.00),
(45565, 'Katz', 'Comp. Sci.', 75000.00),
(58583, 'Califieri', 'History', 62000.00),
(76543, 'Singh', 'Finance', 80000.00),
(76766, 'Crick', 'Biology', 72000.00),
(83821, 'Brandt', 'Comp. Sci.', 92000.00),
(98345, 'Kim', 'Elec. Eng.', 80000.00);

-- 6. Insert into course
INSERT INTO course (course_id, title, dept_name, credits) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);

-- 7. Insert into faculty
INSERT INTO faculty (ID, name, salary, dept_name, building, budget) VALUES
(22222, 'Einstein', 95000.00, 'Physics', 'Watson', 70000.00),
(12121, 'Wu', 90000.00, 'Finance', 'Painter', 120000.00),
(32343, 'El Said', 60000.00, 'History', 'Painter', 50000.00),
(45565, 'Katz', 75000.00, 'Comp. Sci.', 'Taylor', 100000.00),
(98345, 'Kim', 80000.00, 'Elec. Eng.', 'Taylor', 85000.00),
(76766, 'Crick', 72000.00, 'Biology', 'Watson', 90000.00),
(10101, 'Srinivasan', 65000.00, 'Comp. Sci.', 'Taylor', 100000.00),
(58583, 'Califieri', 62000.00, 'History', 'Painter', 50000.00),
(83821, 'Brandt', 92000.00, 'Comp. Sci.', 'Taylor', 100000.00),
(15151, 'Mozart', 40000.00, 'Music', 'Packard', 80000.00),
(33456, 'Gold', 87000.00, 'Physics', 'Watson', 70000.00),
(76543, 'Singh', 80000.00, 'Finance', 'Painter', 120000.00);

-- 8. Insert into advisor
INSERT INTO advisor (s_id, i_id) VALUES
(00128, 45565),
(12345, 10101),
(23121, 76543),
(44553, 22222),
(45678, 22222),
(76543, 45565),
(76653, 98345),
(98765, 98345),
(98988, 76766);

-- 9. Insert into prereq
INSERT INTO prereq (course_id, prereq_id) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- 10. Insert into section
INSERT INTO section (course_id, sec_id, semester, year, building, room_no, time_slot_id) VALUES
('BIO-101', 1, 'Summer', 2009, 'Painter', 514, 'B'),
('BIO-301', 1, 'Summer', 2010, 'Painter', 514, 'A'),
('CS-101', 1, 'Fall', 2009, 'Packard', 101, 'H'),
('CS-101', 1, 'Spring', 2010, 'Packard', 101, 'F'),
('CS-190', 1, 'Spring', 2009, 'Taylor', 3128, 'E'),
('CS-190', 2, 'Spring', 2009, 'Taylor', 3128, 'A'),
('CS-315', 1, 'Spring', 2010, 'Watson', 120, 'D'),
('CS-319', 1, 'Spring', 2010, 'Watson', 100, 'B'),
('CS-319', 2, 'Spring', 2010, 'Taylor', 3128, 'C'),
('CS-347', 1, 'Fall', 2009, 'Taylor', 3128, 'A'),
('EE-181', 1, 'Spring', 2009, 'Taylor', 3128, 'C'),
('FIN-201', 1, 'Spring', 2010, 'Packard', 101, 'B'),
('HIS-351', 1, 'Spring', 2010, 'Painter', 514, 'C'),
('MU-199', 1, 'Spring', 2010, 'Packard', 101, 'D'),
('PHY-101', 1, 'Fall', 2009, 'Watson', 100, 'A');

-- 11. Insert into teaches
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES
(10101, 'CS-101', 1, 'Fall', 2009),
(10101, 'CS-315', 1, 'Spring', 2010),
(10101, 'CS-347', 1, 'Fall', 2009),
(12121, 'FIN-201', 1, 'Spring', 2010),
(15151, 'MU-199', 1, 'Spring', 2010),
(22222, 'PHY-101', 1, 'Fall', 2009),
(32343, 'HIS-351', 1, 'Spring', 2010),
(45565, 'CS-101', 1, 'Spring', 2010),
(45565, 'CS-319', 1, 'Spring', 2010),
(76766, 'BIO-101', 1, 'Summer', 2009),
(76766, 'BIO-301', 1, 'Summer', 2010),
(83821, 'CS-190', 1, 'Spring', 2009),
(83821, 'CS-190', 2, 'Spring', 2009),
(83821, 'CS-319', 2, 'Spring', 2010),
(98345, 'EE-181', 1, 'Spring', 2009);

-- 12. Insert into takes
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES
(128, 'CS-101', 1, 'Fall', 2009, 'A'),
(128, 'CS-347', 1, 'Fall', 2009, 'A'),
(12345, 'CS-190', 1, 'Spring', 2009, 'A'),
(12345, 'CS-190', 2, 'Spring', 2009, 'A'),
(12345, 'CS-315', 1, 'Spring', 2010, 'A'),
(12345, 'CS-347', 1, 'Fall', 2009, 'A'),
(19991, 'HIS-351', 1, 'Spring', 2010, 'B'),
(23121, 'FIN-201', 1, 'Spring', 2010, 'C+'),
(44553, 'PHY-101', 1, 'Fall', 2009, 'B-'),
(45678, 'CS-101', 1, 'Fall', 2009, 'F'),
(45678, 'CS-101', 1, 'Spring', 2010, 'B+'),
(45678, 'CS-319', 1, 'Spring', 2010, 'B'),
(54321, 'CS-101', 1, 'Fall', 2009, 'A-'),
(54321, 'CS-190', 2, 'Spring', 2009, 'B+'),
(55739, 'MU-199', 1, 'Spring', 2010, 'A-'),
(76543, 'CS-101', 1, 'Fall', 2009, 'A'),
(76543, 'CS-319', 2, 'Spring', 2010, 'A'),
(76653, 'EE-181', 1, 'Spring', 2009, 'C'),
(98765, 'CS-101', 1, 'Fall', 2009, 'C-'),
(98765, 'CS-315', 1, 'Spring', 2010, 'B'),
(98988, 'BIO-101', 1, 'Summer', 2009, 'A'),
(98988, 'BIO-301', 1, 'Summer', 2010, NULL);


-- Questions.............................................................

-- 1. Find the average salary in each deparment
select avg(salary)
from faculty
group by dept_name;

-- 2. Find the average salary of all instructor.
select avg(salary)
from faculty;

-- 3. Find the number of instructor in each department who teach a course in spring 2010.
select i.dept_name, count(distinct t.ID) as num_instructor
from instructor i
join teaches t on i.ID = t.ID
where t.semester = 'spring' and year = 2010
group by i.dept_name;

select distinct i.dept_name, t.ID
from instructor i
join teaches t on i.ID = t.ID
where t.semester = 'spring' and year = 2010;

