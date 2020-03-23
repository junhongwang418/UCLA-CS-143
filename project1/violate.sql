-- Primary key constraint for Movie ID
-- This will give us error because movie with id 5 already exists
INSERT INTO Movie (id, title, rating, company)
VALUES (5, "Cat War", "PG-13", "Cat Inc");
-- ERROR 1062 (23000): Duplicate entry '5' for key 'PRIMARY'

-- Primary key constraint for Actor ID
-- This will give us error because actor with id 1 already exists
INSERT INTO Actor (id, last, first, sex, dob)
VALUES (1, "Wang", "Junhong", "Male", "2020-01-26");
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- Primary key constraint for Director ID
-- This will give us error because director with id 16 already exists
INSERT INTO Director (id, last, first, dob)
VALUES (16, "Wang", "Junhong", "2020-01-26");
-- ERROR 1062 (23000): Duplicate entry '16' for key 'PRIMARY'

-- Foreign key constraint for Sales mid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO Sales (mid, ticketsSold, totalIncome)
VALUES (999999999, 10, 200);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`Sales`, 
-- CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Foreign key constraint for MovieGenre mid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO MovieGenre (mid, genre)
VALUES (999999999, "Thriller");
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieGenre`, 
-- CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Foreign key constraint for MovieDirector mid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO MovieDirector (mid, did)
VALUES (999999999, 16);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieDirector`, 
-- CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Foreign key constraint for MovieDirector did
-- This will give us error because director with id 999999999 does not exist
INSERT INTO MovieDirector (mid, did)
VALUES (2, 999999999);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieDirector`, 
-- CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))

-- Foreign key constraint for MovieActor mid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO MovieActor (mid, aid)
VALUES (999999999, 1);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieActor`, 
-- CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Foreign key constraint for MovieActor aid
-- This will give us error because actor with id 999999999 does not exist
INSERT INTO MovieActor (mid, aid) 
VALUES (2, 999999999);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieActor`,
-- CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))

-- Foreign key constraint for MovieRating aid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO MovieRating (mid, imdb, rot)
VALUES (999999999, 50, 50);
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`MovieRating`, 
-- CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Foreign key constraint for Movie mid
-- This will give us error because movie with id 999999999 does not exist
INSERT INTO Review (name, mid, rating, comment)
VALUES ("Junhong Wang", 999999999, 5, "Good movie");
-- ERROR 1452 (23000): Cannot add or update a child row: 
-- a foreign key constraint fails (`TEST`.`Review`, 
-- CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- Check constraint for Actor sex
-- This should give us error because sex is not "Female" or "Male"
INSERT INTO Actor (id, last, first, sex, dob)
VALUES (5, "Wang", "Junhong", "ABC", "2020-01-26");

-- Check constraint for MovieRating imdb
-- This should give us error because imdb is not between 0 and 100
INSERT INTO MovieRating (mid, imdb, rot)
VALUES (2, 150, 50);

-- Check constraint for MovieRating rot
-- This should give us error because rot is not between 0 and 100
INSERT INTO MovieRating (mid, imdb, rot)
VALUES (2, 50, 150);

-- Check constraint for Review rating
-- This should give us error because rating is not between 0 and 5
INSERT INTO Review (name, mid, rating, comment)
VALUES ("Junhong Wang", 2, 100, "Good movie");


