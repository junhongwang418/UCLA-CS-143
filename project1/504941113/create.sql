CREATE TABLE Movie (
	-- Movie ID
	id INT NOT NULL,
	-- Movie title
	title VARCHAR(100) NOT NULL,
	-- Release year
	year INT NOT NULL,
	-- MPAA rating
	rating VARCHAR(10) NOT NULL,
	-- Production company
	company VARCHAR(50) NOT NULL,
	-- Primary key constraint for Movie ID
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE Actor (
	-- Actor ID
	id INT NOT NULL,
	-- Last name
	last VARCHAR(20) NOT NULL,
	-- First name
	first VARCHAR(20) NOT NULL,
	-- Sex of the actor
	sex VARCHAR(6) NOT NULL,
	-- Date of birth
	dob DATE NOT NULL,
	-- Date of death
	dod DATE,
	-- Primary key constraint for Actor ID
	PRIMARY KEY (id),
	-- sex = "Female" or "Male"
	CHECK (sex = "Female" OR sex = "Male")
) ENGINE = InnoDB;

CREATE TABLE Sales (
	-- Movie ID
	mid INT NOT NULL,
	-- number of tickets sold
	ticketsSold INT NOT NULL DEFAULT 0,
	-- total income in US dollars
	totalIncome INT NOT NULL DEFAULT 0,
	-- mid references Movie Table
	FOREIGN KEY (mid) REFERENCES Movie(id)
) ENGINE = InnoDB;

CREATE TABLE Director (
	-- Director ID
	id INT NOT NULL,
	-- Last name
	last VARCHAR(20) NOT NULL,
	-- First name
	first VARCHAR(20) NOT NULL,
	-- Date of birth
	dob DATE NOT NULL,
	-- Date of death
	dod DATE,
	-- Primary key constraint for Director ID
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE MovieGenre (
	-- Movie ID
	mid INT NOT NULL,
	-- Movie genre
	genre VARCHAR(20) NOT NULL,
	-- mid references Movie table
	FOREIGN KEY (mid) REFERENCES Movie(id)
) ENGINE = InnoDB;

CREATE TABLE MovieDirector (
	-- Movie ID
	mid INT NOT NULL,
	-- Director ID
	did INT NOT NULL,
	-- mid references Movie table
	FOREIGN KEY (mid) REFERENCES Movie(id),
	-- did references Director table
	FOREIGN KEY (did) REFERENCES Director(id)
) ENGINE = InnoDB;

CREATE TABLE MovieActor (
	-- Movie ID
	mid INT NOT NULL,
	-- Actor ID
	aid INT NOT NULL,
	-- Actor role in movie
	role VARCHAR(50) NOT NULL,
	-- mid references Movie table
	FOREIGN KEY (mid) REFERENCES Movie(id),
	-- aid references Actor table
	FOREIGN KEY (aid) REFERENCES Actor(id)
) ENGINE = InnoDB;

CREATE TABLE MovieRating (
	-- Movie ID
	mid INT NOT NULL,
	-- IMDb rating
	imdb INT,
	-- Rotten Tomatoes rating
	rot INT,
	-- mid references Movie table
	FOREIGN KEY (mid) REFERENCES Movie(id),
	-- 0 <= imdb <= 100
	CHECK (imdb IS NULL OR (0 <= imdb AND imdb <= 100)),
	-- 0 <= rot <= 100
	CHECK (rot IS NULL OR (0 <= rot AND rot <= 100))
	
) ENGINE = InnoDB;

CREATE TABLE Review (
	-- Reviewer name
	name VARCHAR(20),
	-- Review time
	time TIMESTAMP DEFAULT NOW(),
	-- Movie ID
	mid INT NOT NULL,
	-- Review rating
	rating INT,
	-- Reviewer comment
	comment VARCHAR(500),
	-- mid references Movie table
	FOREIGN KEY (mid) REFERENCES Movie(id),
	-- 0 <= rating <= 5
	CHECK (rating IS NULL OR (0 <= rating AND rating <= 5))
) ENGINE = InnoDB;

CREATE TABLE MaxPersonID (
	-- Max ID assigned to all persons
	id INT
) ENGINE = InnoDB;

CREATE TABLE MaxMovieID (
	-- Max ID assigned to all movies
	id INT
) ENGINE = InnoDB;


