# Library Management System

A structured SQL database project built using PostgreSQL to manage books, library members, librarians, and borrowing records.

This project demonstrates practical database design concepts including relational modeling, primary & foreign keys, joins, aggregate functions, filtering, date functions, and data analysis queries.

---

## Technologies Used

- PostgreSQL
- SQL

---

## Database Features

### Tables Created

- Books
- Members
- Librarians
- Borrow_Records

### Concepts Used

- Primary Keys
- Foreign Keys
- Data Insertion
- Filtering using WHERE
- Aggregate Functions
- GROUP BY
- DISTINCT
- INNER JOIN
- Date Functions
- NULL Handling

---

## Project Structure

```sql
CREATE TABLE books
CREATE TABLE members
CREATE TABLE librarians
CREATE TABLE borrow_records
```

---

## Sample Queries Included

### Book Queries

- Show all available books
- Find books published after 2000
- Find books with less than 2 available copies
- Find books with zero available copies

### Member Queries

- Show members who joined after 2023
- Find members who joined in 2023
- Count total library members

### Borrowing Analysis

- Show names of members who borrowed books
- Track borrow and return records

### Aggregate Queries

- Count total books per category
- Find total copies of books per category

---

## Sample SQL Concepts Demonstrated

```sql
JOIN
GROUP BY
COUNT()
SUM()
DISTINCT
EXTRACT(YEAR FROM date)
WHERE
FOREIGN KEY
```

---

## Learning Outcomes

This project helped me practice:

- Relational database design
- Writing optimized SQL queries
- Working with real-world database structures
- Handling NULL values
- Building analytical queries
- Managing relationships between tables

---

## How to Run

1. Open PostgreSQL or pgAdmin
2. Create a new database
3. Run the SQL script file
4. Execute queries section by section

---

## Author

Saurabh Jadhav
Aspiring Data Engineer | SQL & PostgreSQL Learner
