# University Database Project

This project contains a SQL script for creating and managing a basic University database. It includes the structure of tables, relationships, and initial data entries relevant to a university system.

## Project Description

The University Database project aims to provide a relational database schema that can handle various university operations such as managing students, courses, departments, and enrollments.

## Features

* Creation of essential university tables such as Students, Courses, Departments, and Enrollments.
* Relationships established using foreign keys.
* Sample data insertion for demonstration purposes.
* Ready-to-run SQL script compatible with MySQL/MariaDB or any standard SQL-compliant DBMS.

## Technologies Used

* SQL (Structured Query Language)
* MySQL / MariaDB (Recommended)

## How to Use

1. Install MySQL or any preferred SQL database.
2. Open your SQL client (e.g., MySQL Workbench, phpMyAdmin).
3. Import the `University.sql` file into your database.
4. Execute the script to create and populate the database.
5. Explore and query the database using SQL.

## Usage Example

```sql
-- Get all students
SELECT * FROM Students;

-- List all courses offered by the Computer Science department
SELECT c.CourseName
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
```

## Folder Structure

```
├── University.sql
└── README.md
```

## Author

* Rizwan Shah

## License

This project is open-source and available under the [MIT License](LICENSE).
