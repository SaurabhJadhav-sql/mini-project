==========================================
-- Library Management System
-- Author: Saurabh Jadhav
-- Database: PostgreSQL
-- ============================================


-- =====================================================
-- 1️⃣ Create Tables
-- =====================================================

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(30),
    author VARCHAR(50),
    category VARCHAR(50),
    published_year INT,
    total_copies INT,
    available_copies INT
);


CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(40),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(50),
    membership_date DATE
);


CREATE TABLE librarians (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    hire_date DATE
);


CREATE TABLE borrow_records (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    librarian_id INT,
    borrow_date DATE,
    return_date DATE,

    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id)
);


-- =====================================================
-- 2️⃣ Insert Sample Data
-- =====================================================

INSERT INTO books VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5, 2),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 4, 1),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 6, 3),
(4, 'Clean Code', 'Robert C. Martin', 'Programming', 2008, 3, 1),
(5, 'The Pragmatic Programmer', 'Andrew Hunt', 'Programming', 1999, 4, 2),
(6, 'Atomic Habits', 'James Clear', 'Self Help', 2018, 5, 4);



INSERT INTO members VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '9876543210', '2022-05-10'),
(2, 'Priya Singh', 'priya@gmail.com', '9876543211', '2023-01-12'),
(3, 'Rahul Verma', 'rahul@gmail.com', '9876543212', '2021-11-20'),
(4, 'Sneha Patel', 'sneha@gmail.com', '9876543213', '2024-02-15'),
(5, 'Arjun Mehta', 'arjun@gmail.com', '9876543214', '2023-08-05');



INSERT INTO librarians VALUES
(1, 'Ravi Kumar', 'ravi@library.com', '2020-06-15'),
(2, 'Neha Gupta', 'neha@library.com', '2021-03-22'),
(3, 'Sanjay Patel', 'sanjay@library.com', '2019-09-10')

INSERT INTO borrow_records VALUES
(1, 1, 1, 1, '2024-01-10', '2024-01-20'),
(2, 2, 2, 2, '2024-02-05', '2024-02-15'),
(3, 3, 3, 1, '2024-02-12', NULL),
(4, 4, 1, 3, '2024-03-01', NULL),
(5, 5, 4, 2, '2024-03-10', '2024-03-18'),
(6, 1, 5, 1, '2024-03-15', NULL);



-- =====================================================
-- 3️⃣ Library System Queries
-- =====================================================


-- Show all books available in the library
SELECT book_id, title
FROM books
WHERE available_copies > 0;



-- Show all members who joined after 2023
SELECT name, membership_date
FROM members
WHERE membership_date >= '2023-01-01';



-- Show books that currently have zero available copies
SELECT title, available_copies
FROM books
WHERE available_copies = 0;



-- Show the names of members who borrowed books
SELECT DISTINCT m.name
FROM borrow_records b
JOIN members m
ON b.member_id = m.member_id;



--Count Total books per category
Select category,Count(*) AS total_books
From Books
Group by Category


    
--Find total copies of books per category
Select Category,Sum(Total_Copies) As Total_Copies
From Books 
Group by Category 


    
--Find books published after 2000
Select Title,Published_year
From Books
Where Published_Year > 2000;



--Find Books with less than two available copies
Select Title,available_copies
From Books
Where available_copies < 2;



--Count total library members
Select Count(*) As total_available_members
From Members  


    
--Find members who joined in 2023
Select Name,Membership_Date
From Members
Where Extract(Year From membership_date) = 2023;



-- =====================================================
-- Debug Queries (Check Data)
-- =====================================================

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM librarians;
SELECT * FROM borrow_records;
