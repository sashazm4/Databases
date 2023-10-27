INSERT INTO SGroup(Name)
VALUES ('KN');

INSERT INTO SGroup(Name)
VALUES ('Pht');

INSERT INTO SGroup(Name)
VALUES ('MM');

INSERT INTO SGroup(Name)
VALUES ('Phi');

INSERT INTO SGroup(Name)
VALUES ('AB');

INSERT INTO Student (FirstName, LastName, Code)
VALUES ('Ivan', 'Vasilenko', 123);

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (1, 'Vasilii', 'Petrov', 456);

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (2, 'Artem', 'Volobuev', 134);

INSERT INTO Student (FirstName, LastName)
VALUES ('Danil', 'Smith');

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (3, 'John', 'Stones', 631);

INSERT INTO Course (Name)
VALUES ('Physics');

INSERT INTO Course (Name)
VALUES ('Mathematical analysis');

INSERT INTO Course (Name)
VALUES ('Algebra');

INSERT INTO Course (Name)
VALUES ('Computer science');

INSERT INTO Course (Name)
VALUES ('Computer graphics');

INSERT INTO Deadline (CourseID, Date, Type)
VALUES 
	    (2, CURRENT_DATE + INTERVAL '7 days', 0),
    	(2, CURRENT_DATE - INTERVAL '7 days', 1),
    	(3, CURRENT_DATE + INTERVAL '3 days', 0),
    	(4, CURRENT_DATE + INTERVAL '7 days', 1),
    	(5, CURRENT_DATE - INTERVAL '5 days', 0);


INSERT INTO Mark (StudentID, DeadlineID, Value)
VALUES 
		(2, 2, 5),
    	(3, 1, 4),
    	(3, 2, 4),
    	(5, 5, 3),
    	(2, 4, 4);