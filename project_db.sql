﻿DROP TABLE IF EXISTS errors CASCADE;
DROP TABLE IF EXISTS schedule_week CASCADE;
DROP TABLE IF EXISTS schedule CASCADE;
DROP TABLE IF EXISTS discipline CASCADE;
DROP TABLE IF EXISTS class_period CASCADE;
DROP TABLE IF EXISTS class_type CASCADE;
DROP TABLE IF EXISTS day_name CASCADE;
DROP TABLE IF EXISTS weeks CASCADE;
DROP TABLE IF EXISTS teacher CASCADE;
DROP TABLE IF EXISTS classroom CASCADE;
DROP TABLE IF EXISTS specialty CASCADE;

CREATE TABLE IF NOT EXISTS specialty (
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS classroom (
	id INT(11) AUTO_INCREMENT NOT NULL,
	capacity INT(11) NULL,
	projector BIT NULL,
	computers BIT NULL,
	board BIT NULL,
	building INT(11) NOT NULL,
	_number VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS teacher (
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	degree VARCHAR(255) NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS weeks (
	id INT(11) AUTO_INCREMENT NOT NULL,
	_number INT(11) NOT NULL,
	start_date DATE NULL,
	end_date DATE NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS day_name (
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS class_type (
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS class_period (
	id INT(11) AUTO_INCREMENT NOT NULL,
	period INT(11) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS discipline (
	id INT(11) AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS schedule (
	id INT(11) AUTO_INCREMENT NOT NULL,
	course INT(11) NOT NULL,
	specialty_id INT(11) NOT NULL,
	day_name_id INT(11) NOT NULL,
	class_period_id INT(11) NOT NULL,
	classroom_id INT(11) NULL,
	discipline_id INT(11) NOT NULL,
	class_type_id INT(11) NOT NULL,
	teacher_id INT(11) NOT NULL,
	group_number VARCHAR(256) NULL,
	FOREIGN KEY (specialty_id) REFERENCES specialty(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (day_name_id) REFERENCES day_name(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (class_period_id) REFERENCES class_period(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (classroom_id) REFERENCES classroom(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (discipline_id) REFERENCES discipline(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (class_type_id) REFERENCES class_type(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (teacher_id) REFERENCES teacher(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS schedule_week (
	id INT(11) AUTO_INCREMENT NOT NULL,
	schedule_id INT(11) NOT NULL,
	weeks_id INT(11) NOT NULL,
	FOREIGN KEY (schedule_id) REFERENCES schedule(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (weeks_id) REFERENCES weeks(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

CREATE TABLE IF NOT EXISTS errors (
	id INT(11) AUTO_INCREMENT NOT NULL,
	schedule_id INT(11) NOT NULL UNIQUE,
	FOREIGN KEY (schedule_id) REFERENCES schedule(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET=UTF8;

INSERT INTO day_name(name) VALUES ("Понеділок");
INSERT INTO day_name(name) VALUES ("Вівторок");
INSERT INTO day_name(name) VALUES ("Середа");
INSERT INTO day_name(name) VALUES ("Четвер");
INSERT INTO day_name(name) VALUES ("П`ятниця");
INSERT INTO day_name(name) VALUES ("Субота");

INSERT INTO class_type(name) VALUES ("Лекція");
INSERT INTO class_type(name) VALUES ("Практика");

INSERT INTO class_period(period) VALUES (1);
INSERT INTO class_period(period) VALUES (2);
INSERT INTO class_period(period) VALUES (3);
INSERT INTO class_period(period) VALUES (4);
INSERT INTO class_period(period) VALUES (5);
INSERT INTO class_period(period) VALUES (6);
INSERT INTO class_period(period) VALUES (7);

INSERT INTO weeks(id, _number) VALUES (1, 1);
INSERT INTO weeks(id, _number) VALUES (2, 2);
INSERT INTO weeks(id, _number) VALUES (3, 3);
INSERT INTO weeks(id, _number) VALUES (4, 4);
INSERT INTO weeks(id, _number) VALUES (5, 5);
INSERT INTO weeks(id, _number) VALUES (6, 6);
INSERT INTO weeks(id, _number) VALUES (7, 7);
INSERT INTO weeks(id, _number) VALUES (8, 8);
INSERT INTO weeks(id, _number) VALUES (9, 9);
INSERT INTO weeks(id, _number) VALUES (10, 10);
INSERT INTO weeks(id, _number) VALUES (11, 11);
INSERT INTO weeks(id, _number) VALUES (12, 12);
INSERT INTO weeks(id, _number) VALUES (13, 13);
INSERT INTO weeks(id, _number) VALUES (14, 14);
INSERT INTO weeks(id, _number) VALUES (15, 15);

INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (1, 1, '223', 60, 0, 1, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (2, 1, '225', 74, 0, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (3, 1, '310', 40, 1, 1, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (4, 1, '313', 108, 0, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (5, 1, '108', 15, 1, 1, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (6, 1, '112', 15, 1, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (7, 1, '206', 15, 1, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (8, 1, '208', 15, 1, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (9, 1, '306', 15, 1, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (10, 1, '307', 15, 1, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (11, 1, '309', 15, 1, 1, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (12, 1, '331', 15, 1, 1, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (13, 3, '220a', 30, 0, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (14, 3, '302', 52, 0, 0, 1);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (15, 10, '1', 15, 1, 1, 0);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (16, 10, '2', 15, 1, 1, 0);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (17, 10, '3', 15, 1, 1, 0);
INSERT INTO classroom(id, building, _number, capacity, computers, projector, board) VALUES (18, 10, '4', 15, 1, 1, 0);
