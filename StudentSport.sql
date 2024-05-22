-- Создание базы данных
USE MASTER;
GO
DROP DATABASE IF EXISTS StudentSports;
GO
CREATE DATABASE StudentSports;
GO
USE StudentSports;
GO

-- Создание таблицы студентов (Students)
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    course INT,
    birthdate DATE
) AS NODE;

-- Создание таблицы видов спорта (SportTypes)
CREATE TABLE SportTypes (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(500)
) AS NODE;

-- Создание таблицы соревнований (Competitions)
CREATE TABLE Competitions (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    date DATETIME
) AS NODE;


-- Создание таблицы участия студентов в видах спорта (StudentSports)
CREATE TABLE StudentSports (
    [rank] VARCHAR(50)
) AS EDGE;

-- Создание таблицы участия студентов в соревнованиях (StudentCompetitions)
CREATE TABLE StudentCompetitions (
    result VARCHAR(100)
) AS EDGE;


-- Заполнение таблицы Students
INSERT INTO Students (id, name, email, course, birthdate) VALUES
(1, 'John Doe', 'john@example.com', 2, '2000-01-01'),
(2, 'Jane Smith', 'jane@example.com', 3, '2001-05-15'),
(3, 'Mike Johnson', 'mike@example.com', 1, '2002-09-20'),
(4, 'Emily Brown', 'emily@example.com', 2, '1999-03-10'),
(5, 'David Lee', 'david@example.com', 4, '2000-11-25'),
(6, 'Chris Green', 'chris@example.com', 3, '2001-08-14'),
(7, 'Katie Holmes', 'katie@example.com', 1, '2000-04-22'),
(8, 'Paul Walker', 'paul@example.com', 4, '1999-06-18'),
(9, 'Laura Palmer', 'laura@example.com', 2, '2002-02-28'),
(10, 'Sam Adams', 'sam@example.com', 3, '2001-12-10');

-- Заполнение таблицы SportTypes
INSERT INTO SportTypes (id, name, description) VALUES
(1, 'Football', 'Association football'),
(2, 'Basketball', 'Team sport'),
(3, 'Swimming', 'Individual sport'),
(4, 'Athletics', 'Track and field events'),
(5, 'Volleyball', 'Team sport'),
(6, 'Tennis', 'Individual sport'),
(7, 'Boxing', 'Individual sport'),
(8, 'Gymnastics', 'Individual sport'),
(9, 'Baseball', 'Team sport'),
(10, 'Hockey', 'Team sport');

-- Заполнение таблицы Competitions
INSERT INTO Competitions (id, name, date) VALUES
(1, 'City Championship', '2024-03-10'),
(2, 'Regional Tournament', '2024-04-20'),
(3, 'National Meet', '2024-05-15'),
(4, 'International Cup', '2024-06-25'),
(5, 'State Finals', '2024-07-30'),
(6, 'Summer Open', '2024-08-18'),
(7, 'Boxing Challenge', '2024-09-22'),
(8, 'Gymnastics Gala', '2024-10-05'),
(9, 'World Series', '2024-11-12'),
(10, 'Ice Hockey Cup', '2024-12-14');


-- Заполнение таблицы StudentSports

INSERT INTO StudentSports ($from_id, $to_id, [rank])
VALUES
	(
		(SELECT $node_id FROM Students WHERE id = 1),
		(SELECT $node_id FROM SportTypes WHERE id = 1),
		'Captain'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 4),
		(SELECT $node_id FROM SportTypes WHERE id = 3),
		'Member'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 5),
		(SELECT $node_id FROM SportTypes WHERE id = 2),
		'Captain'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 5),
		(SELECT $node_id FROM SportTypes WHERE id = 2),
		'Athlete'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM SportTypes WHERE id = 1),
		'Captain'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM SportTypes WHERE id = 2),
		'Player'
	),	
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM SportTypes WHERE id = 5),
		'Member'
	),	
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM SportTypes WHERE id = 9),
		'Participant'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM SportTypes WHERE id = 6),
		'Captain'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 9),
		(SELECT $node_id FROM SportTypes WHERE id = 3),
		'Player'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM SportTypes WHERE id = 7),
		'Champion'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 10),
		(SELECT $node_id FROM SportTypes WHERE id = 4),
		'Athlete'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 3),
		(SELECT $node_id FROM SportTypes WHERE id = 8),
		'Player'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 8),
		(SELECT $node_id FROM SportTypes WHERE id = 10),
		'Goalie'
	)
;
GO


-- Заполнение таблицы StudentCompetitions

INSERT INTO StudentCompetitions ($from_id, $to_id, result)
VALUES
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM Competitions WHERE id = 1),
		'First Place'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 1),
		(SELECT $node_id FROM Competitions WHERE id = 2),
		'Second Place'
	),	
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM Competitions WHERE id = 2),
		'Third Place'
	),	
	
	(
		(SELECT $node_id FROM Students WHERE id = 5),
		(SELECT $node_id FROM Competitions WHERE id = 2),
		'Participant'
	),	
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM Competitions WHERE id = 5),
		'Participant'
	),	
	(
		(SELECT $node_id FROM Students WHERE id = 6),
		(SELECT $node_id FROM Competitions WHERE id = 9),
		'Third Place'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM Competitions WHERE id = 6),
		'First Place'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM Competitions WHERE id = 3),
		'Participant'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 2),
		(SELECT $node_id FROM Competitions WHERE id = 7),
		'Winner'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 3),
		(SELECT $node_id FROM Competitions WHERE id = 4),
		'Second Place'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 3),
		(SELECT $node_id FROM Competitions WHERE id = 8),
		'Finalist'
	),
	(
		(SELECT $node_id FROM Students WHERE id = 8),
		(SELECT $node_id FROM Competitions WHERE id = 10),
		'Winner'
	)
;
GO



-- Найти всех студентов, участвующих в 'Football'
SELECT s.name AS StudentName
FROM Students as s,
	StudentSports as SS,
	SportTypes as ST
WHERE MATCH(s -(SS)->ST)
	and ST.name = 'Football';

-- Найти всех студентов, участвующих в 'Team sport'
SELECT distinct s.name AS StudentName
FROM Students as s,
	StudentSports as SS,
	SportTypes as ST
WHERE MATCH(s -(SS)->ST) 
and ST.description = 'Team sport';

-- Найти всех студентов, участвующих в соревнованиях 'City Championship'
SELECT s.name AS StudentName
FROM Students as s,
	StudentCompetitions as SC,
	Competitions as C
WHERE  MATCH(s -(SC)->C) and C.name = 'City Championship';

-- Найти всех студентов, участвующих в соревнованиях по виду спорта 'Basketball'
SELECT distinct s.name AS StudentName
FROM Students as s,
	StudentCompetitions as SC,
	Competitions as C,
	StudentSports as SS,
	SportTypes as ST
WHERE MATCH(s -(SS)->ST) and MATCH(s -(SC)->C)
		and ST.name = 'Basketball';

-- Найти все соревнования, в которых участвовал студент 'John Doe'
SELECT c.name AS CompetitionName
FROM Students as s,
	StudentCompetitions as SC,
	Competitions as C
WHERE MATCH(s -(SC)->C) and s.name = 'John Doe';




-- Найти кратчайший путь между студентами через виды спорта
SELECT s1.name AS Student1, s2.name AS Student2, COUNT(*) AS PathLength
FROM Students s1, Students s2, StudentSports ss1, StudentSports ss2, SportTypes st
WHERE s1.id = ss1.student_id AND ss1.sport_type_id = st.id
AND st.id = ss2.sport_type_id AND ss2.student_id = s2.id
AND MATCH(SHORTEST_PATH(s1-(ss1)->st<-(ss2)-s2))
GROUP BY s1.name, s2.name;

-- Найти кратчайший путь между студентами через соревнования
SELECT s1.name AS Student1, s2.name AS Student2, COUNT(*) AS PathLength
FROM Students s1, Students s2, StudentCompetitions sc1, StudentCompetitions sc2, Competitions c
WHERE s1.id = sc1.student_id AND sc1.competition_id = c.id
AND c.id = sc2.competition_id AND sc2.student_id = s2.id
AND MATCH(SHORTEST_PATH(s1-(sc1)->c<-(sc2)-s2))
GROUP BY s1.name, s2.name;
