CREATE TYPE buyer_civ AS ENUM('Monsieur','Madame','Mademoiselle');
CREATE TYPE spectator_civ AS ENUM('Monsieur','Madame','Mademoiselle');
CREATE TYPE booking_price AS ENUM('Plein tarif','Tarif réduit','Senior','Etudiant');
CREATE TYPE price_type AS ENUM('Plein tarif','Tarif réduit','Senior','Etudiant');
CREATE TABLE Buyer (buyer_id serial PRIMARY KEY NOT NULL , buyer_fname varchar(50) NOT NULL, buyer_lname varchar(50) NOT NULL,buyer_age smallint NOT NULL,buyer_email varchar(63) NOT NULL UNIQUE, buyer_civ buyer_civ NOT NULL);
CREATE TABLE Spectator(spectator_id serial PRIMARY KEY NOT NULL,spectator_fname varchar(50) NOT NULL,spectator_lname varchar(50) NOT NULL,spectator_age smallint NOT NULL, spectator_civ spectator_civ NOT NULL);
CREATE TABLE Game(game_id serial PRIMARY KEY NOT NULL,game_name varchar(255) NOT NULL,game_timestamp int NOT NULL,game_day date NOT NULL,game_vr boolean NOT NULL);
CREATE TABLE Price(price_type price_type PRIMARY KEY NOT NULL, price_value float NOT NULL);
INSERT INTO Price(price_type,price_value) VALUES ('Plein tarif',9.40);
INSERT INTO Price(price_type,price_value) VALUES ('Tarif réduit',7.40);
INSERT INTO Price(price_type,price_value) VALUES ('Senior',6.80);
INSERT INTO Price(price_type,price_value) VALUES ('Etudiant',6.80);
CREATE TABLE Booking(game_id int NOT NULL, buyer_id int NOT NULL, spectator_id int NOT NULL,PRIMARY KEY(game_id,buyer_id,spectator_id), FOREIGN KEY (game_id) REFERENCES Game (game_id), FOREIGN KEY (buyer_id) REFERENCES Buyer (buyer_id), FOREIGN KEY (spectator_id) REFERENCES Spectator (spectator_id),booking_price booking_price NOT NULL);