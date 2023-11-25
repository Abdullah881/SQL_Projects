-- Create TABLE library_branch
-- library_branch has no foreign keys and can be considered independent.
CREATE TABLE library_branch(
    branch_id INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
    branch_name VARCHAR(50) NOT NULL,
    branch_address VARCHAR(100) NOT NULL
);

-- Create table books
-- books has one foreign key, book_publisher_name, which likely references the publisher table.
CREATE TABLE books (
    book_id INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
    book_title VARCHAR(50) NOT NULL,
    book_publisher_name VARCHAR(50) NOT NULL -- FK publishers
);

-- Create table book_copies
-- book_copies has two foreign keys, book_id and branch_id, which likely reference the books and library_branch tables, respectively.
CREATE TABLE book_copies(
    book_id INT NOT NULL,
    branch_id INT NOT NULL,
    number_of_copies INT NOT NULL
);

-- Create table borrower
-- borrower has no foreign keys and is independent.
CREATE TABLE borrower(
    card_no INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    borrower_name VARCHAR(50) NOT NULL,
    borrower_address VARCHAR(50) NOT NULL,
    borrower_phone VARCHAR(50) NOT NULL
);

-- Create table book_loans
-- book_loans has three foreign keys: book_id, branch_id, and card_no. These likely reference the books, library_branch, and borrower tables, respectively.
CREATE TABLE book_loans (
    book_id INT NOT NULL, -- FK, tbl- books 
    branch_id INT NOT NULL, -- FK tbl-library_branch
    card_no INT NOT NULL, -- FK tbl-borrowers
    date_out DATE NOT NULL,
    date_due DATE NOT NULL 
);

-- Create table publisher
-- publisher has no foreign keys and is independent.
CREATE TABLE publisher(
    publisher_name VARCHAR(50) NOT NULL PRIMARY KEY,
    publisher_address VARCHAR(50) NOT NULL,
    publisher_phone VARCHAR(50) NOT NULL
);

-- Create table book_authors
-- book_authors has one foreign key, book_id, which likely references the books table.
CREATE TABLE book_authors (
    book_id INT NOT NULL , -- FK Books 
    author_name VARCHAR(50) NOT NULL
);


/*
library_branch has no foreign keys and is independent.
books has one foreign key, book_publisher_name, which references the publisher table.
book_copies has two foreign keys, book_id and branch_id, which reference the books and library_branch tables, respectively.
borrower has no foreign keys and is independent.
book_loans has three foreign keys: book_id, branch_id, and card_no, which reference the books, library_branch, and borrower tables, respectively.
publisher has no foreign keys and is independent.
book_authors has one foreign key, book_id, which references the books table.
*/


-- Add a foreign key constraint to the books table
ALTER TABLE books
ADD CONSTRAINT FK_Book_Publisher
FOREIGN KEY (book_publisher_name) REFERENCES publisher(publisher_name);

-- Add a foreign key constraint for the book_id column in book_copies
ALTER TABLE book_copies
ADD CONSTRAINT FK_BookCopies_Books
FOREIGN KEY (book_id) REFERENCES books(book_id);

-- Add a foreign key constraint for the branch_id column in book_copies
ALTER TABLE book_copies
ADD CONSTRAINT FK_BookCopies_LibraryBranch
FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id);

-- Add a foreign key constraint for the book_id column in book_loans
ALTER TABLE book_loans
ADD CONSTRAINT FK_BookLoans_Books
FOREIGN KEY (book_id) REFERENCES books(book_id);

-- Add a foreign key constraint for the branch_id column in book_loans
ALTER TABLE book_loans
ADD CONSTRAINT FK_BookLoans_LibraryBranch
FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id);

-- Add a foreign key constraint for the card_no column in book_loans
ALTER TABLE book_loans
ADD CONSTRAINT FK_BookLoans_Borrower
FOREIGN KEY (card_no) REFERENCES borrower(card_no);


-- Add a foreign key constraint to the books_authors table
ALTER TABLE book_authors
ADD CONSTRAINT FK_BookAuthors_books
FOREIGN KEY (book_id) REFERENCES books(book_id)

-- add libraries
INSERT INTO library_branch (branch_name, branch_address)
VALUES
    ('Sharpstown', '123 Main Street'),
    ('Central', '456 Elm Street'),
    ('Westside', '789 Oak Avenue'),
    ('North End', '101 Pine Road'),
    ('Southside', '222 Willow Lane'),
    ('Eastwood', '333 Birch Street');

SELECT * FROM library_branch
--Add Borrowers 

INSERT INTO borrower (borrower_name, borrower_address, borrower_phone)
VALUES
    ('John Smith', '123 Elm Street', '555-1234'),
    ('Alice Johnson', '456 Oak Avenue', '555-5678'),
    ('Michael Brown', '789 Maple Lane', '555-9876'),
    ('Emily Davis', '101 Pine Road', '555-4321'),
    ('David Wilson', '222 Cedar Drive', '555-8765'),
    ('Sarah Lee', '333 Birch Street', '555-2345'),
    ('Daniel Kim', '444 Pine Lane', '555-6789'),
    ('Olivia Martinez', '555 Oak Road', '555-3456');

SELECT * FROM borrower

-- add publisher names 

INSERT INTO publisher (publisher_name, publisher_address, publisher_phone)
VALUES
    ('Penguin', '123 Robot Street', '555-1287'),
    ('Random House', '456 Shadow Avenue', '555-7254'),
    ('HarperCollins', '789 Water Lane', '555-1123'),
    ('Simon & Schuster', '101 Tree Road', '555-1283');

SELECT * FROM publisher

INSERT INTO books (book_title, book_publisher_name)
VALUES
    ('Harry Potter', 'Penguin'),
    ('The Lost Tribe', 'Random House'),
    ('To Kill a Mockingbird', 'HarperCollins'),
    ('The Great Gatsby', 'Simon & Schuster'),
    ('1984', 'Penguin'),
    ('Pride and Prejudice', 'Random House'),
    ('The Catcher in the Rye', 'HarperCollins'),
    ('Brave New World', 'Simon & Schuster'),
    ('The Hobbit', 'Penguin'),
    ('Lord of the Rings', 'Random House'),
    ('The Da Vinci Code', 'HarperCollins'),
    ('The Shining', 'Simon & Schuster'),
    ('The Hunger Games', 'Penguin'),
    ('Gone with the Wind', 'Random House'),
    ('To the Lighthouse', 'HarperCollins'),
    ('The Odyssey', 'Simon & Schuster'),
    ('Moby-Dick', 'Penguin'),
    ('War and Peace', 'Random House'),
    ('Crime and Punishment', 'HarperCollins'),
    ('Animal Farm', 'Penguin');

SELECT * FROM books

INSERT INTO book_authors (book_id,author_name)
VALUES 
    (7, 'Harper Lee'),
    (8, 'J.K. Rowling'),
    (9, 'George Orwell'),
    (10, 'Mark Twain'),
    (11, 'Jane Austen'),
    (12, 'William Shakespeare'),
    (7, 'Agatha Christie'),
    (8, 'Charles Dickens'),
    (9, 'F. Scott Fitzgerald'),
    (10, 'Leo Tolstoy');

SELECT * FROM book_authors


INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES
    (2, 1, 3),
    (2, 2, 4),
    (3, 3, 5),
    (4, 4, 3),
    (5, 5, 4),
    (6, 1, 5),
    (7, 2, 3),
    (8, 3, 4),
    (9, 4, 5),
    (10, 5, 3);



INSERT INTO book_copies (book_id, branch_id, number_of_copies)
VALUES
    (3, 1, 3);


SELECT * FROM book_copies

-- Insert 10 random entries into the book_loans table
INSERT INTO book_loans (book_id, branch_id, card_no, date_out, date_due)
VALUES
    (2, 2, 3, '2023-10-10', '2023-11-10'),
    (4, 3, 4, '2023-10-12', '2023-11-12'),
    (7, 4, 5, '2023-10-15', '2023-11-15'),
    (10, 5, 6, '2023-10-18', '2023-11-18'),
    (13, 1, 7, '2023-10-20', '2023-11-20'),
    (16, 2, 8, '2023-10-23', '2023-11-23'),
    (19, 3, 7, '2023-10-26', '2023-11-26'),
    (2, 4, 6, '2023-10-29', '2023-11-29'),
    (5, 1, 5, '2023-11-01', '2023-12-01'),
    (8, 2, 4, '2023-11-03', '2023-12-03');

SELECT * FROM book_loans


SELECT *
FROM (
    (book_loans
    FULL OUTER JOIN borrower ON book_loans.card_no = borrower.card_no)
    FULL OUTER JOIN books ON book_loans.book_id = books.book_id
)
ORDER BY books.book_id;


--Using the library database you created, create a query that returns all book titles and the authors name.

SELECT * 
FROM books 
left join book_authors ON books.book_id = book_authors.book_id
order by books.book_id
;

SELECT * FROM book_copies

SELECT * 
FROM library_branch
inner join book_copies
ON library_branch.branch_id = book_copies.branch_id
inner join books
ON book_copies.book_id = books.book_id
WHERE library_branch.branch_name = 'Sharpstown' and books.book_title = 'the lost tribe'

SELECT * 
FROM library_branch
inner join book_copies
ON library_branch.branch_id = book_copies.branch_id
inner join books
ON book_copies.book_id = books.book_id
WHERE books.book_title = 'the lost tribe'

SELECT *
FROM borrower
LEFT JOIN book_loans ON borrower.card_no = book_loans.card_no
WHERE book_loans.card_no IS NULL;


SELECT *
FROM borrower
Where borrower_name = 'John Smith'