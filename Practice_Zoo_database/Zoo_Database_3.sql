-- Drop tables if they exist
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tbl_movies')
    DROP TABLE tbl_movies;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tbl_actor')
    DROP TABLE tbl_actor;

-- Create table for movies
CREATE TABLE tbl_movies (
    movie_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    movie_name VARCHAR(50) NOT NULL,
    movie_year VARCHAR(50) NOT NULL,
    movie_budget MONEY NOT NULL
);

-- Create table for actors
CREATE TABLE tbl_actor (
    actor_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    actor_movie_id INT NOT NULL,
    actor_fname VARCHAR(50) NOT NULL,
    actor_lname VARCHAR(50) NOT NULL,
    actor_age INT NOT NULL,
    actor_net MONEY NOT NULL,
    CONSTRAINT fk_order_id FOREIGN KEY (actor_movie_id) REFERENCES tbl_movies(movie_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Insert data for movies
INSERT INTO tbl_movies (movie_name, movie_year, movie_budget)
VALUES
    ('Star Wars: Episode IV - A New Hope', '1977', 11000000),
    ('Jurassic Park', '1993', 63000000),
    ('The Lion King', '1994', 45000000),
    ('Titanic', '1997', 200000000),
    ('Avatar', '2009', 237000000);

-- Insert data for actors
INSERT INTO tbl_actor (actor_movie_id, actor_fname, actor_lname, actor_age, actor_net)
VALUES
    (1, 'Mark', 'Hamill', 26, 6000000),
    (2, 'Laura', 'Dern', 27, 12000000),
    (3, 'James', 'Earl Jones', 67, 45000000),
    (4, 'Kate', 'Winslet', 22, 4500000),
    (5, 'Sam', 'Worthington', 33, 6000000);


-- Insert data for actors
INSERT INTO tbl_actor (actor_movie_id, actor_fname, actor_lname, actor_age, actor_net)
VALUES
    (1, 'Carrie', 'Fisher', 41, 15000000),
    (2, 'Sam', 'Neill', 52, 18000000),
    (3, 'Matthew', 'Broderick', 31, 25000000),
    (4, 'Leonardo', 'DiCaprio', 23, 26000000),
    (5, 'Zoe', 'Saldana', 31, 28000000);

INSERT INTO tbl_movies (movie_name, movie_year, movie_budget)
VALUES
    ('MyMovie', '1998', 2370892300000);

INSERT INTO tbl_actor (actor_movie_id, actor_fname, actor_lname, actor_age, actor_net)
VALUES
    (6, 'Abdullah', 'Altaf', 25, 15000000);


-- Retrieve data from tables
SELECT * FROM tbl_actor;
SELECT * FROM tbl_movies;

SELECT *
From tbl_actor
Where actor_net >= 15000000
ORDER by actor_fname

SELECT *
From tbl_actor
inner join tbl_movies
on tbl_actor.actor_movie_id = tbl_movies.movie_id
where tbl_movies.movie_year > 1993
ORDER by actor_fname
