create database Study;

USE Study;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT CONCAT(author_fname,' ',author_lname)
FROM books;

SELECT CONCAT_WS(' - ',author_fname,author_lname)
FROM books;

SELECT SUBSTRING('Hello World',1,4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTR('hello world',-3);

SELECT
	CONCAT(SUBSTR(title,1,10),'...')
FROM books;

SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REVERSE('Hello World');

SELECT CHAR_LENGTH('Hello World');

SELECT UPPER('Hello World');

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  
  SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM books;

SELECT concat(title,' was released in ',released_year) AS blurb
FROM books;

SELECT CONCAT(SUBSTR(title,1,10),'...') AS 'short title',
	CONCAT(author_lname,',',author_fname) AS author,
	CONCAT(stock_quantity,' in stock') AS quantity
FROM books
ORDER BY 1;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


SELECT DISTINCT(author_lname) FROM books;

SELECT DISTINCT(CONCAT(author_fname,' ',author_lname))
FROM books;

SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT released_year FROM books
ORDER BY released_year DESC;

SELECT title,author_fname,author_lname
FROM books
ORDER BY 3;

SELECT title,author_fname,author_lname
FROM books
ORDER BY author_fname,author_lname
LIMIT 5;


/* LIMIT starting_point, how many records*/
/*get two records start from 1st row*/
/*index start from 0 for row 1... etc*/
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,2;


SELECT * FROM books
WHERE author_fname LIKE 'D__' 

SELECT *
FROM books
WHERE stock_quantity LIKE '____';


SELECT * FROM books
WHERE title LIKE '%\%%';

SELECT * FROM books
WHERE title LIKE '%stories%';

SELECT title,pages
FROM books
ORDER BY pages DESC
LIMIT 1;


/*Print a summary containing the title and year, for the 3 most recent books*/
SELECT CONCAT(title,' ',released_year) AS 'summary'
FROM books
ORDER BY released_year DESC
LIMIT 3;


/*Find all books with an author_lname that contains a space(" ")*/
SELECT title,author_lname
FROM books
WHERE author_lname LIKE '% %';


/*Print title and author_lname, sorted first by author_lname and then by title*/
SELECT title,author_lname
FROM books
ORDER BY 2,1;


/*Find The 3 Books With The Lowest Stock Select title, year, and stock */
SELECT title,released_year,stock_quantity
FROM books
ORDER BY stock_quantity
LIMIT 3;


/*Sorted Alphabetically By Last Name*/
SELECT CONCAT('MY FAVOURITE AUTHOR IS ',UPPER(author_fname),' ',UPPER(author_lname)) AS 'YELL'
FROM books
ORDER BY author_lname;

